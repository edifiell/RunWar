//
//  MainVM.swift
//  RunWar
//
//  Created by @IBaction on 01.11.2021.
//

import Foundation
import CoreLocation

final class MainVM: NSObject, CLLocationManagerDelegate {
    @Published var speed = "0.00"
    private var last: CLLocation?
    private let lm = CLLocationManager()
    

    func viewDidLoad() {
        lm.requestAlwaysAuthorization()
        lm.delegate = self
    }
    func processLocation(_ current:CLLocation) {
        guard last != nil else {
            last = current
            return
        }
        var speed = current.speed
        if (speed > 0) {
            let speed = speed * 3.6
            self.speed = String(format: "%.2f", speed)
            print(self.speed) // or whatever
        } else {
            speed = last!.distance(from: current) / (current.timestamp.timeIntervalSince(last!.timestamp))
            speed = speed * 3.6
            self.speed = String(format: "%.2f", speed)
            print(speed)
        }
        last = current
    }
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        for location in locations {
            processLocation(location)
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() { }
            }
        }
    }
    func action() {
        lm.startUpdatingLocation()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.speed = "0.00"
        }
    }
}
