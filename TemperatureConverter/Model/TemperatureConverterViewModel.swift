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
    @Published var outputUnitCelsius = "Celsius"
    @Published var outputUnitKelvin = "Kelvin"
    
    let units = ["Celsius": UnitTemperature.celsius, "Fahrenheit": UnitTemperature.fahrenheit, "Kelvin": UnitTemperature.kelvin]
    
    var result: (celsius: Double, kelvin: Double) {
        guard
            let inputUnit = units[inputUnit],
            let outputUnitCelsius = units[outputUnitCelsius],
            let outputUnitKelvin = units[outputUnitKelvin]
                
        else { return (0.0, 0.0) }
        
        let input = Measurement(value: initialValue, unit: inputUnit)
        let outputCelsius = input.converted(to: outputUnitCelsius)
        let outputKelvin = input.converted(to: outputUnitKelvin)
        
        return (outputCelsius.value, outputKelvin.value)
    }
    
}
