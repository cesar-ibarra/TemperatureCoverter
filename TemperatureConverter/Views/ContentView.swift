//
//  ContentView.swift
//  TemperatureConversion
//
//  Created by Cesar Ibarra on 10/28/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TemperatureConverterViewModel()
    @State private var imageBackground : ImageBackground?
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    
                    VStack {
                        ZStack {
                            VStack(alignment: .center) {
                                Text("\(viewModel.initialValue, specifier: "%.0f")˚")
                                    .font(.system(size: 90, weight: .medium))
                                Text("Fachrenheit")
                            }
                            .offset(x: -55)
                            
                                Slider(value: $viewModel.initialValue, in: 0...150, step: 1)
                                    .rotationEffect(.degrees(-90))
                                    .padding(.trailing, -260)
                                    .frame(maxWidth: 90)
                                    .accentColor(.white)
                        } //: ZSTACK
                                            
                    } //: VSTACK
                    .offset(y: -75)
                    Spacer()
                    
                    
                    HStack {
                        Spacer()
                        Section {
                            VStack(alignment: .center) {
                                Text("\(viewModel.result.celsius, specifier: "%.0f")˚")
                                    .font(.system(size: 45, weight: .medium))
                                
                                Text("Celsius")

                            } //: VSTACK
                        } //:SECTION
                        
                        Spacer()
                        
                        Section {
                            VStack(alignment: .center) {
                                Text("\(viewModel.result.kelvin, specifier: "%.0f")˚")
                                    .font(.system(size: 45, weight: .medium))
                                
                                Text("Kelvin")
                                
                            } //: VSTACK
                        } //:SECTION
                        Spacer()
                    } //: HSTACK
                    Spacer()
                    
                } //: VSTACK
            } //: ZSTACK
            .background(
                Image((imageBackground != nil) ? imageBackground?.name as! String : "image-5")
                        .ignoresSafeArea(.all, edges: .all)
                        .colorMultiply(.gray)
                        
            )
        } //: NavigationView
        .foregroundColor(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
