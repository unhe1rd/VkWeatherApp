//
//  SearchViewController.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 25.03.2024.
//


import UIKit
import CoreLocation

class SearchViewController: UIViewController, CLLocationManagerDelegate {
    
    private let output: SearchViewOutput
    private var searchModel: SearchViewModel?
    private var searchDebouncer: Debouncer?
    
    private let titleLabel = UILabel()
    private let searchBar = UISearchBar()
    private let cityTable = UITableView()
    private let messageLabel = UILabel()
    private let cityView = CityWeatherView()
    
    init(output: SearchViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        output.didLoadView()
    }
}

private extension SearchViewController {
    func setupUI(){
        view.backgroundColor = Constants.backgroundColor
        setupTitle()
        setupSearchBar()
        setupMessageLabel()
        setupCityView()
        setupCityTable()
    }
    
    func setupTitle() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Search weather"
        titleLabel.textAlignment = .center
        titleLabel.textColor = Constants.textColor
        titleLabel.font = UIFont.systemFont(ofSize: 40)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setupSearchBar() {
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.delegate = self
        searchBar.placeholder = "Search by city..."
        searchBar.showsBookmarkButton = true
        searchBar.setImage(UIImage(systemName: "house.fill"), for: .bookmark, state: .normal)
        
        searchBar.barTintColor = Constants.backgroundColor
        searchBar.tintColor = Constants.backgroundColor
        searchBar.searchTextField.textColor = Constants.textColorInCell
        searchBar.searchTextField.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
    }
    
    func setupCityTable() {
        cityTable.translatesAutoresizingMaskIntoConstraints = false
        cityTable.delegate = self
        cityTable.dataSource = self
        cityTable.showsVerticalScrollIndicator = false
        cityTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        cityTable.backgroundColor = Constants.backgroundColor
        cityTable.layer.cornerRadius = 16
        cityTable.isHidden = true
        
        view.addSubview(cityTable)
        
        NSLayoutConstraint.activate([
            cityTable.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            cityTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cityTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cityTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
    
    func setupMessageLabel() {
        view.addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = "Search weather by city..."
        messageLabel.textColor = Constants.textColor
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 46)
        messageLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    
    func setupCityView(){
        view.addSubview(cityView)
        cityView.translatesAutoresizingMaskIntoConstraints = false
        cityView.layer.cornerRadius = 16
        cityView.isHidden = true
        
        NSLayoutConstraint.activate([
            cityView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            cityView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            cityView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cityView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}

//SearchBar
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DispatchQueue.main.async { [self] in
            output.didChangeSearchText(searchText)
            searchDebouncer?.reset()
            searchDebouncer = Debouncer(delay: 1) { [weak self] in
                self!.configureCityView(with: self!.searchModel!, cityName: searchText)
                self!.cityView.isHidden = false
            }
            searchDebouncer?.call()
    }
}
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        let isUsingDefaultIcon = searchBar.image(for: .bookmark, state: .normal) == UIImage(systemName: "house.fill")
        let newIcon = isUsingDefaultIcon ? UIImage(systemName: "xmark.circle") : UIImage(systemName: "house.fill")
        searchBar.setImage(newIcon, for: .bookmark, state: .normal)
        
        cityTable.isHidden = !cityTable.isHidden
        messageLabel.isHidden = !messageLabel.isHidden
    }
}


//TableView
extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        PopularCity.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = PopularCity.allCases[indexPath.row].rawValue
        cell.textLabel?.font = .boldSystemFont(ofSize: 16)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            
            let cityName = (cell.textLabel?.text) ?? ""
            DispatchQueue.main.async {
                self.output.didTapOnCityTabel(cityName)
                self.configureCityView(with: self.searchModel!, cityName: cityName)
            }
            
            tableView.isHidden = !tableView.isHidden
            messageLabel.isHidden = !messageLabel.isHidden
            
            if let selectedIndexPath = tableView.indexPathsForSelectedRows?.first {
                tableView.deselectRow(at: selectedIndexPath, animated: true)
            }
        }
    }
}


//Setup View by Presenter
extension SearchViewController: SearchViewInput {
    func configureCityView(with model: SearchViewModel, cityName: String) {
        DispatchQueue.main.async {
            self.searchModel = model
            self.cityView.configue(with: cityName, model: model)
            self.cityView.isHidden = false
        }
    }
    
    func configure(with model: SearchViewModel){
        DispatchQueue.main.async {
            self.searchModel = model
        }
    }
    
    func didLoadView(){
        
    }  
}
