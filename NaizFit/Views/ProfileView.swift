//
//  ProfileView.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 25/1/24.
//

import SwiftUI

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
                PerkConditionView(viewModel: viewModel)
            }
            
            if viewModel.changeHeight {
                UpdateHeightUserView(viewModel: viewModel)
            }
            
            if viewModel.changeWeight {
                UpdateWeightUserView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    ProfileView()
}
