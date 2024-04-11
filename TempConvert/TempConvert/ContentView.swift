//
//  ContentView.swift
//  TempConvert
//
//  Created by Alexis Córdova on 4/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var baseUnitTemperature: Double = 0
    @State private var baseUnit = "Celsius"
    @State private var convertToUnit = "Fahrenheit"
    
    let units = ["Celsius", "Fahrenheit", "kelvin"]
    var convertedTemperature: Double {
        var convertedTempCelsius: Double = baseUnitTemperature
        
        if baseUnit == convertToUnit { return baseUnitTemperature }
        
        switch baseUnit {
        case "Fahrenheit":
            convertedTempCelsius = 5/9 * (baseUnitTemperature - 32)
        case "kelvin":
            convertedTempCelsius = baseUnitTemperature - 273.15
        default:
            convertedTempCelsius = baseUnitTemperature
        }
        
        switch convertToUnit {
        case "Fahrenheit":
            return convertedTempCelsius * 9/5 + 32
        case "kelvin":
            return convertedTempCelsius + 273.15
        default:
            return convertedTempCelsius
        }
        
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField(
                        "Enter your base unit value",
                        value: $baseUnitTemperature,
                        format: .number
                    )
                    
                    Picker("Base unit", selection: $baseUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("Convert to", selection: $convertToUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Output") {
                    Text(convertedTemperature, format: .number)
                }
            }
            .navigationTitle("TempConvert")
        }
    }
}

#Preview {
    ContentView()
}
