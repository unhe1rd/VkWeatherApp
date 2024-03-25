//
//  Debouncer.swift
//  WeatherApp
//
//  Created by Mike Ulanov on 25.03.2024.
//

import Foundation

class Debouncer {
    let delay: TimeInterval
    var callback: (() -> Void)
    var timer: Timer?

    init(delay: TimeInterval, callback: @escaping (() -> Void)) {
        self.delay = delay
        self.callback = callback
    }

    func call() {
        timer?.invalidate()
        let nextTimer = Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(fireNow), userInfo: nil, repeats: false)
        timer = nextTimer
    }

    @objc func fireNow() {
        callback()
    }

    func reset() {
        timer?.invalidate()
    }
}
