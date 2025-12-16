//
//  TemperatureConversionApp.swift
//  TemperatureConversion
//
//  Created by Cesar Ibarra on 10/28/22.
//

import SwiftUI
import GoogleMobileAds

@main
struct TemperatureConverterApp: App {
    
    init() {
        MobileAds.shared.start(completionHandler: nil)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
