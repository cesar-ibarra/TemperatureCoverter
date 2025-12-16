//
//  ContentView.swift
//  TemperatureConversion
//
//  Created by Cesar Ibarra on 10/28/22.
//

import SwiftUI

struct ContentView: View {
    @State private var imageBackground: String = getRandomImageName()
    @State private var celsius: Double = 0.0
    
    // Conversión de Celsius a Fahrenheit
    var fahrenheit: Double {
        (celsius * 9/5) + 32
    }
    
    // Conversión de Celsius a Kelvin
    var kelvin: Double {
        celsius + 273.15
    }
    
    var body: some View {
        
        VStack {
            // MARK: - BANNER
            AdMobBanner()
                .frame(width: 320, height: 50)
            
            CircularSlider(value: $celsius)
                .frame(width: 250, height: 250)
                .padding(.top, 120)
            
            Spacer()
            
            HStack {
                Spacer()
                Section {
                    VStack(alignment: .center) {
                        Text("\(fahrenheit, specifier: "%.1f")˚")
                            .font(.system(size: 45, weight: .medium))
                        
                        Text("Fahrenheit")
                        
                    } //: VSTACK
                } //:SECTION
                
                Spacer()
                
                Section {
                    VStack(alignment: .center) {
                        Text("\(kelvin, specifier: "%.1f")˚")
                            .font(.system(size: 45, weight: .medium))
                        
                        Text("Kelvin")
                        
                    } //: VSTACK
                } //:SECTION
                Spacer()
            } //: HSTACK
            Spacer()
            
            
        } //: ZSTACK
        .background(
            Image(imageBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
        .foregroundColor(Color.white)
    }
}

#Preview {
    ContentView()
}
