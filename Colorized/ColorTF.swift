//
//  ColorTF.swift
//  Colorized
//
//  Created by Игорь Солодянкин on 25.04.2023.
//

import SwiftUI

struct ColorTF: View {
    @Binding var textValue: String
    @Binding var sliderValue: Double
    
    @State private var alertPresent = false
    
    var body: some View {
        TextField("", text: $textValue) { _ in
            withAnimation {
                checkData()
            }
        }
            .textFieldStyle(.roundedBorder)
            .multilineTextAlignment(.center)
            .frame(width: 50)
            .keyboardType(.numberPad)
            .alert(
                "Не верный формат",
                isPresented: $alertPresent,
                actions: {}) {
                    Text("Введите значение от 0 до 255"
                    )
                }
    }
}

extension ColorTF {
    private func checkData() {
        if let value = Int(textValue), (0...255).contains(value) {
            self.sliderValue = Double(value)
            return
        }
        alertPresent.toggle()
        sliderValue = 0
        textValue = "0"
    }
}

struct ColorTF_Previews: PreviewProvider {
    static var previews: some View {
        ColorTF(textValue: .constant(""), sliderValue: .constant(10))
    }
}
