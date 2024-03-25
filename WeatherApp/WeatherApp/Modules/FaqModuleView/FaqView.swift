//
//  FaqView.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 25.03.2024.
//

import SwiftUI

struct FaqView: View {
    var body: some View {
        ScrollView(){
            Section(header: FaqHeader()){
                LazyVStack(alignment:.leading, spacing: 8){
                    ForEach(faqModel) { item in
                        FaqSubview(imageName: item.imageName, description: item.description)
                    }
                    .padding(.leading, 16)
                }
            }
        }
        .background(Color.black)
        .ignoresSafeArea()
    }
}

struct FaqHeader: View {
    var body: some View{
        Text("Weather FAQ")
            .foregroundStyle(.white)
            .font(.title)
            .padding(.top, 120)
    }
}

struct FaqSubview: View {
    let imageName:String
    let description:String
    var body: some View {
        VStack(alignment:.leading){
            HStack(){
                Image(systemName: imageName)
                    .scaledToFill()
                    .foregroundStyle(.white)
                Text(description)
                    .foregroundStyle(.white)
                    .font(.title2)
            }
        }
    }
}

#Preview {
    FaqView()
}
