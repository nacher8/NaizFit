//
//  PerkInfoView.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 26/1/24.
//

import SwiftUI

// A view with all information about the PERK.
struct PerkInfoView: View {
    
    var perkInfo: NaizPerkModel
    
    var body: some View {
        HStack(alignment: .top) {
            Image(perkInfo.image)
                .resizable()
                .frame(width: 102, height: 102)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(perkInfo.name)
                    .font(.custom("Inter-Regular", size: 16))
                    .fontWeight(.medium)
                
                Text(perkInfo.brand)
                    .font(.custom("Inter-Regular", size: 14))
                
                Text(perkInfo.perkType)
                    .font(.custom("Inter-Regular", size: 10))
                    .foregroundStyle(Color.cardTextGrey)
                
                Spacer()
                
                HStack {
                    Text(perkInfo.expirationDate)
                        .font(.custom("Inter-Regular", size: 10))
                        .foregroundStyle(Color.cardTextGrey)
                    
                    Spacer()
                    
                    Capsule(style: .continuous)
                        .fill(perkInfo.perkColor.background)
                        .frame(width: 63, height: 24)
                        .overlay(
                            Text("Perk type")
                                .font(.custom("Inter-Regular", size: 10))
                                .foregroundStyle(perkInfo.perkColor.text)
                        )
                }
            }
            .padding(.leading, 8)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.cardGrey)
        )
    }
}
