//
//  ContentView.swift
//  TemperatureConversion
//
//  Created by Cesar Ibarra on 10/28/22.
//

import SwiftUI

struct ContentView: View {
    @State private var initialValue: Double = 0
    @State private var inputUnit = "Celsius"
    @State private var outputUnit = "Celsius"
    
    let units = ["Celcius": UnitTemperature.celsius, "Fahrenheit": UnitTemperature.fahrenheit, "Kelvin": UnitTemperature.kelvin]
    
    var result: Double {
        guard
            let inputUnit = units[inputUnit],
            let outputUnit = units[outputUnit]
        else { return 0 }
        
        let input = Measurement(value: initialValue, unit: inputUnit)
        let output = input.converted(to: outputUnit)
        
        return output.value
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Convert")) {
                        TextField("Temperature", value: $initialValue, format: .number)
                            .keyboardType(.decimalPad)
                            .font(.system(size: 40))
                        Picker("Temperature", selection: $inputUnit) {
                            ForEach(Array(units.keys), id: \.self) {
                                Text($0)
                            }//: FOREACH
                        } //: PICKER
                        .pickerStyle(.segmented)
                    } //: SECTION
                    
                    Section(header: Text("To:")) {
                        Picker("Value", selection: $outputUnit) {
                            ForEach(Array(units.keys), id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section(header: Text("Result")) {
                        Text("\(result, specifier: "%.2f")")
                            .font(.system(size: 40))
                    } //: SECTION
                } //: FORM
            } //: VSTACK
        } //: NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
