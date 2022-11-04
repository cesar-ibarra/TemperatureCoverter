//
//  TemperatureConverterViewModel.swift
//  TemperatureConversion
//
//  Created by Cesar Ibarra on 11/2/22.
//

import Foundation

final class TemperatureConverterViewModel: ObservableObject {
    @Published var initialValue: Double = 0
    @Published var inputUnit = "Fahrenheit"
    @Published var outputUnit = "Celsius"
    
    let units = ["Celsius": UnitTemperature.celsius, "Fahrenheit": UnitTemperature.fahrenheit, "Kelvin": UnitTemperature.kelvin]
    
    var result: Double {
        guard
            let inputUnit = units[inputUnit],
            let outputUnit = units[outputUnit]
        else { return 0 }
        
        let input = Measurement(value: initialValue, unit: inputUnit)
        let output = input.converted(to: outputUnit)
        
        return output.value
    }
    
}
