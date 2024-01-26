//
//  NaizButton.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 26/1/24.
//

import SwiftUI

struct NaizButton: View {
    var action: () -> Void
    var title: String
    var buttonColor: Color
    
    init(action: @escaping () -> Void, title: String, buttonColor: Color = Color.naizOrange) {
        self.action = action
        self.title = title
        self.buttonColor = buttonColor
    }
    
    var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                Text(title)
                    .font(.custom("MontserratRoman-Regular", size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 10)
            }
            .padding()
            .background(buttonColor)
            .cornerRadius(8)
        }
    }
}
