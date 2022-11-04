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
                Spacer()
                
                VStack {
                    HStack {
                        TextField("", value: $viewModel.initialValue, format: .number)
                            .keyboardType(.decimalPad)
                            .font(.system(size: 70, weight: .medium))
                            .frame(maxWidth: 125)
                            .multilineTextAlignment(.center)
                        Text("˚")
                            .font(.system(size: 70, weight: .medium))
                    }
                    
                    Picker(selection: $viewModel.inputUnit, label: EmptyView()) {
                        ForEach(Array(viewModel.units.keys), id: \.self) {
                            Text($0)
                        }//: FOREACH
                    } //: PICKER
                    .labelsHidden()
                } //: VSTACK
                
                Spacer()
                
                VStack {
                    HStack {
                        Text("\(viewModel.result, specifier: "%.0f")")
                            .font(.system(size: 70, weight: .medium))
                            .frame(maxWidth: 125)
                        Text("˚")
                            .font(.system(size: 70, weight: .medium))
                    }
                    
                    Picker(selection: $viewModel.outputUnit, label: EmptyView()) {
                        ForEach(Array(viewModel.units.keys), id: \.self) {
                            Text($0)
                        }//: FOREACH
                    } //: PICKER
                    .labelsHidden()
                    .frame(maxWidth: .infinity)
                } //: VSTACK
                Spacer()
                
            } //: VSTACK
        } //: NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
