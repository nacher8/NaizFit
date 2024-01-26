//
//  PersonalInfoView.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 25/1/24.
//

import SwiftUI

// A view displaying personal information, including user details and completion options.
struct PersonalInfoView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(viewModel.naizUser?.qrCode ?? "")
                    .shadow(radius: 4)
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text(viewModel.naizUser?.name ?? "")
                        .font(.custom("MontserratRoman-Regular", size: 20))
                        .fontWeight(.medium)
                    
                    HStack {
                        Image("PinkLevel")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .overlay {
                                Text(viewModel.naizUser?.level ?? "")
                                    .font(.custom("DMSans-9ptRegular_SemiBold", size: 14))
                            }
                        
                        Text("Level " + (viewModel.naizUser?.level ?? ""))
                            .font(.custom("DMSans-9ptRegular_Black", size: 10))
                        
                        Divider()
                            .frame(width: 1.0, height: 13)
                            .background(Color.black)
                        
                        Text(viewModel.naizUser?.nextLevel ?? "")
                            .font(.custom("DMSans-9ptRegular", size: 10))
                            .foregroundStyle(Color.naizGrey)
                        
                    }
                    .padding(.top, 2)
                    
                    HStack {
                        Text("Height: ")
                            .font(.custom("MontserratRoman-Regular", size: 14))
                            .fontWeight(.medium)
                        
                        Button(action: {
                            viewModel.changeHeight.toggle()
                        }) {
                            Text("\(viewModel.naizUser?.height ?? "") cms")
                                .font(.custom("MontserratRoman-Regular", size: 14))
                                .foregroundStyle(Color.naizOrange)
                        }
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("Weight: ")
                            .font(.custom("MontserratRoman-Regular", size: 14))
                            .fontWeight(.medium)
                        
                        Button(action: {
                            viewModel.changeWeight.toggle()
                        }) {
                            Text("\(viewModel.naizUser?.weight ?? "") kgs")
                                .font(.custom("MontserratRoman-Regular", size: 14))
                                .foregroundStyle(Color.naizOrange)
                                .underline()
                        }
                        
                        Spacer()
                    }
                }
                Spacer()
            }
            
            NaizButton(action: {
                print("Completer profile")
            }, title: "Complete profile")
        }
        .padding(.horizontal, 16)
    }
}
