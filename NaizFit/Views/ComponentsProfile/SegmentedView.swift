//
//  SegmentedView.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 25/1/24.
//

import SwiftUI

struct SegmentedView: View {    
    @ObservedObject var viewModel: ProfileViewModel
    @State private var selected: SegmentedTypes = .perks
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                ForEach(SegmentedTypes.allCases) { segment in
                    Button(action: {
                        selected = segment
                    }) {
                        VStack {
                            Text(segment.rawValue)
                                .font(.custom("DMSans-9ptRegular", size: 14))
                                .fontWeight(.medium)
                                .foregroundStyle(selected == segment ? Color.black : Color.segmentGrey)
                            
                            ZStack {
                                Rectangle()
                                    .fill(Color.segmentGreyBar)
                                    .frame(height: 1)
                                if selected == segment {
                                    Rectangle()
                                        .fill(Color.segmentOrange)
                                        .frame(height: 3)
                                }
                            }
                            
                        }
                    }
                }
            }
            
            switch selected {
            case .perks:
                ScrollView {
                    VStack {
                        ForEach(viewModel.mockData, id: \.id) { perkInfo in
                            PerkInfoView(perkInfo: perkInfo)
                                .onTapGesture {
                                    viewModel.perkInfoCondtion = perkInfo
                                    viewModel.showCondition.toggle()
                                }
                        }
                    }
                    .padding(.bottom, 16)
                }
                
            case .nepsHistory:
                EmptyInfoView()
                    .padding(.top, 32)
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .onAppear {
            selected = .perks
        }
    }
}
