//
//  ColorElements.swift
//  Colorized
//
//  Created by Игорь Солодянкин on 25.04.2023.
//

import SwiftUI

struct ColorElements: View {
    @State private var textValue = ""
    @Binding var sliderValue: Double
    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(sliderValue))")
                .foregroundColor(color)
                .frame(width: 50)
                .onChange(of: sliderValue) { newValue in
                    textValue = "\(lround(sliderValue))"
                }
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .accentColor(color)
            ColorTF(textValue: $textValue, sliderValue: $sliderValue)
        }
        .onAppear {
            textValue = "\(lround(sliderValue))"
        }
    }
}

struct ColorElements_Previews: PreviewProvider {
    static var previews: some View {
        ColorElements(sliderValue: .constant(0), color: .red)
    }
}
