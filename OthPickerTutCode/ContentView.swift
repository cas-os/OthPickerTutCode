//
//  ContentView.swift
//  OthPickerTutCode
//
//  Created by HAL-9001 on 10/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    var colors: [Color] = [.black, .red, .green, .blue]
    var colorNames = ["Black", "Red", "Green", "Blue"]
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "String in Rotate mode"
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                Text(text)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .rotationEffect(.degrees(rotation))
                    .animation(.easeInOut, value: rotation)
                    .foregroundColor(colors[colorIndex])
                Spacer()
                Slider(value: $rotation, in: 0...360, step: 0.1)
                    .padding()
                TextField("Enter the text :: ", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Picker(
                    selection: $colorIndex,
                    label: Text("Color")) { // nie widac tego tekstu?
                        ForEach (0..<colorNames.count) {
                            Text(colorNames[$0])
                                .foregroundColor(colors[$0])
                        }
                    }
                    .pickerStyle(.wheel)
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
