//
//  PerkConditionView.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 26/1/24.
//

import SwiftUI

struct PerkConditionView: View {
    @EnvironmentObject var viewModel: ProfileViewModel
    @State private var offset: CGFloat = 100
    
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.8)
                .onTapGesture {
                    close()
                }
            VStack {
                VStack(alignment: .center) {
                    Image("Discount")
                    
                    Text("30% discount at \(viewModel.perkInfoCondtion?.brand ?? "")")
                        .font(.custom("DMSans-9ptRegular", size: 20))
                        .fontWeight(.bold)
                        .padding()
                    
                    Text("Expiration date")
                        .font(.custom("DMSans-9ptRegular", size: 12))
                        .foregroundStyle(Color.popupGrey)
                        .padding(.bottom, 4)
                    
                    Text(viewModel.perkInfoCondtion?.expirationDate ?? "")
                        .font(.custom("DMSans-9ptRegular", size: 14))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.naizOrange)
                }
                .padding(.bottom, 24)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Term of use")
                        .font(.custom("DMSans-9ptRegular", size: 12))
                        .fontWeight(.medium)
                    
                    TermUseView(text: "Aplicable en 1 artículo de la Colección OI23, excluido Escoté y otras colaboraciones.")
                    
                    TermUseView(text: "Aplicable solo en tiendas físicas de España, excluidas Outlets o El Corte Inglés")
                    
                    TermUseView(text: "No aplicable en artículos de las temporadas anteriores.")
                    
                    TermUseView(text: "No acumulable con otras promociones/campañas.")
                    
                    NaizButton(action: {
                        close()
                    }, title: "Got it")
                    .padding(.top, 16)
                }
            }
            .padding()
            .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
            .offset(x: 0, y: offset)
            .onAppear {
                offset = 0
            }
        }
        .ignoresSafeArea()
    }
    
    private func close() {
        offset = 1000
        viewModel.showCondition = false
    }
}

public struct TermUseView: View {
    
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    public var body: some View {
        HStack(alignment: .top) {
            Image("Dot")
            
            Text(text)
                .font(.custom("DMSans-9ptRegular", size: 12))
                .padding(.top, -4)
        }
    }
}
