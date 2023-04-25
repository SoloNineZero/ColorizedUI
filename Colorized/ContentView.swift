//
//  ContentView.swift
//  Colorized
//
//  Created by Игорь Солодянкин on 25.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue = Double.random(in: 0...255)
    @State private var greenValue = Double.random(in: 0...255)
    @State private var blueValue = Double.random(in: 0...255)
    
    @State private var rectangleColor = Color.gray
    
    @FocusState private var focus: Bool
    
    var body: some View {
        ZStack {
            Color(red: 36 / 255, green: 76 / 255, blue: 147 / 255)
                .ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 15)
                    .frame(height: 200)
                    .foregroundColor(Color(
                        red: redValue / 255,
                        green: greenValue / 255,
                        blue: blueValue / 255
                    )
                    )
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 1)
                    )
                    .padding(.bottom, 30)
                VStack {
                    ColorElements(sliderValue: $redValue, color: .red)
                    ColorElements(sliderValue: $greenValue, color: .green)
                    ColorElements(sliderValue: $blueValue, color: .blue)
                }
                .focused($focus)
                .toolbar{
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            focus = false
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
        .onTapGesture {
            hideKeyBoard()
        }
    }
    
    private func hideKeyBoard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
