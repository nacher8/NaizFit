//
//  StadisticsView.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 25/1/24.
//

import SwiftUI

// A view displaying metrics information.
struct StadisticsView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        HStack {
            StadisticsComponentView(stadisticInfo: viewModel.naizUser?.neps ?? "", stadisticTitle: "NEPS")
            Spacer()
            Divider()
                .frame(width: 1.0, height: 38)
            Spacer()
            StadisticsComponentView(stadisticInfo: viewModel.naizUser?.reports ?? "", stadisticTitle: "Reports")
            Spacer()
            Divider()
                .frame(width: 1.0, height: 38)
            Spacer()
            StadisticsComponentView(stadisticInfo: viewModel.naizUser?.coins ?? "", stadisticTitle: "Coins")
        }
        .padding(.horizontal, 48)
    }
}

struct StadisticsComponentView: View {
    
    var stadisticInfo: String
    var stadisticTitle: String
    
    init(stadisticInfo: String, stadisticTitle: String) {
        self.stadisticInfo = stadisticInfo
        self.stadisticTitle = stadisticTitle
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text(stadisticInfo)
                .font(.custom("MontserratRoman-Regular", size: 18))
            
            Text(stadisticTitle)
                .font(.custom("DMSans-9ptRegular", size: 10))
                .fontWeight(.bold)
                .foregroundStyle(Color.naizGrey)
        }
    }
}
