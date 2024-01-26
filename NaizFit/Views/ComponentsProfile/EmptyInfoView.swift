//
//  EmptyInfoView.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 25/1/24.
//

import SwiftUI

struct EmptyInfoView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text("You still do not have any PERK")
                .font(.custom("Inter-Regular_SemiBold", size: 12))
                .frame(maxWidth: .infinity)
            
            Text("Lorem ipsum dolor Lorem ipsum dolorLorem ipsum dolorLorem ipsum dolor")
                .font(.custom("Inter-Regular", size: 12))
                .multilineTextAlignment(.center)
                .foregroundStyle(Color.cardTextGrey)
                .padding(.bottom, 16)
            
            NaizButton(action: {
                print("GET PERKS")
            }, title: "GET PERKS")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.cardGrey)
        )
        .padding()
    }
}

#Preview {
    EmptyInfoView()
}
