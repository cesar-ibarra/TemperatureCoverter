//
//  CircularSlider.swift
//  TemperatureConverter
//
//  Created by Cesar Ibarra on 2/28/25.
//

//
//  CircularSlider.swift
//  TemperatureConverter
//
//  Created by Cesar Ibarra
//

import SwiftUI

struct CircularSlider: View {
    @Binding var value: Double
    
    var minValue: Double = -900
    var maxValue: Double = 900
    var lineWidth: CGFloat = 15
    var knobSize: CGFloat = 30
    
    // MARK: - Manual Input State
    @State private var isEditingManually = false
    @State private var manualValue: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        GeometryReader { geometry in
            let radius = geometry.size.width / 2
            let angleRange = 2 * Double.pi
            let normalizedValue = (value - minValue) / (maxValue - minValue)
            let angle = normalizedValue * angleRange - .pi / 2
            
            ZStack {
                
                // MARK: - Background Circle
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: lineWidth)
                
                // MARK: - Progress Circle
                Circle()
                    .trim(from: 0.0, to: CGFloat(normalizedValue))
                    .stroke(
                        AngularGradient(
                            gradient: Gradient(colors: [.blue, .yellow, .orange, .red]),
                            center: .center
                        ),
                        style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut(duration: 0.2), value: value)
                
                // MARK: - Center Value (Text / TextField)
                if isEditingManually {
                    TextField("", text: $manualValue)
                        .keyboardType(.decimalPad)
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 140)
                        .focused($isFocused)
                        .onAppear {
                            manualValue = String(format: "%.1f", value)
                            isFocused = true
                        }
                        .onSubmit {
                            applyManualValue()
                        }
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button("Done") {
                                    applyManualValue()
                                }
                            }
                        }
                } else {
                    Text("\(value, specifier: "%.1f")°C")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.white)
                        .onTapGesture {
                            isEditingManually = true
                        }
                }
                
                // MARK: - Knob
                Circle()
                    .frame(width: knobSize, height: knobSize)
                    .foregroundColor(.white)
                    .shadow(radius: 3)
                    .offset(
                        x: radius * CGFloat(cos(angle)),
                        y: radius * CGFloat(sin(angle))
                    )
                    .gesture(
                        DragGesture().onChanged { drag in
                            let vector = CGVector(
                                dx: drag.location.x - radius,
                                dy: drag.location.y - radius
                            )
                            
                            let dragAngle = atan2(vector.dy, vector.dx) + .pi / 2
                            let adjustedAngle = dragAngle < 0
                                ? dragAngle + 2 * .pi
                                : dragAngle
                            
                            let newValue =
                                minValue +
                                (adjustedAngle / angleRange) *
                                (maxValue - minValue)
                            
                            value = (min(max(newValue, minValue), maxValue) * 10).rounded() / 10
                        }
                    )
            }
        }
        .padding(lineWidth / 2)
    }
    
    // MARK: - Manual Value Validation
    private func applyManualValue() {
        if let newValue = Double(manualValue),
           newValue >= minValue,
           newValue <= maxValue {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                value = (newValue * 10).rounded() / 10
            }
        }
        
        isEditingManually = false
        isFocused = false
    }
}

#Preview {
    StatefulPreviewWrapper(0.0) {
        CircularSlider(value: $0)
            .frame(width: 250, height: 250)
            .background(Color.black)
    }
}

// MARK: - Preview Helper
struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State private var value: Value
    let content: (Binding<Value>) -> Content
    
    init(_ value: Value, @ViewBuilder content: @escaping (Binding<Value>) -> Content) {
        self._value = State(initialValue: value)
        self.content = content
    }
    
    var body: some View {
        content($value)
    }
}
