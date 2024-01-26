//
//  ProfileView.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 25/1/24.
//

import SwiftUI

// A view with the Profile information.
struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 32) {
                PersonalInfoView(viewModel: viewModel)
                
                StadisticsView()
                
                SegmentedView(viewModel: viewModel)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
            .onAppear {
                viewModel.getPerks()
            }
            
            if viewModel.showCondition {
                PerkConditionView()
            }
            
            if viewModel.changeHeight {
                UpdateHeightUserView()
            }
            
            if viewModel.changeWeight {
                UpdateWeightUserView()
            }
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    ProfileView()
}
