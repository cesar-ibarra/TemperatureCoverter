//
//  ContentView.swift
//  TemperatureConversion
//
//  Created by Cesar Ibarra on 10/28/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TemperatureConverterViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Convert")) {
                        TextField("Temperature", value: $viewModel.initialValue, format: .number)
                            .keyboardType(.decimalPad)
                            .font(.system(size: 40))
                        Picker("Temperature", selection: $viewModel.inputUnit) {
                            ForEach(Array(viewModel.units.keys), id: \.self) {
                                Text($0)
                            }//: FOREACH
                        } //: PICKER
                        .pickerStyle(.segmented)
                    } //: SECTION
                    
                    Section(header: Text("To:")) {
                        Picker("Value", selection: $viewModel.outputUnit) {
                            ForEach(Array(viewModel.units.keys), id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    
                    Section(header: Text("Result")) {
                        Text("\(viewModel.result, specifier: "%.2f")")
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
