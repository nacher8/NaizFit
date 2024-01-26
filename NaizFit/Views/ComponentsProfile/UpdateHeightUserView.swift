//
//  ChangeInfoUserView.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 26/1/24.
//

import SwiftUI

struct UpdateHeightUserView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State private var offset: CGFloat = 100
    @State private var valueTextField: String = ""
    
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.8)
                .onTapGesture {
                    close()
                }
            
            VStack {
                Text("What is your height?")
                    .font(.custom("DMSans-9ptRegular", size: 20))
                    .fontWeight(.bold)
                    .padding()
                
                TextField("Enter your height in cms", text: $valueTextField)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .padding(.bottom, 16)
                
                HStack {
                    NaizButton(action: {
                        close()
                    }, title: "Cancel",
                               buttonColor: Color.naizGrey)
                    
                    NaizButton(action: {
                        viewModel.saveHeight(valueTextField)
                        close()
                    }, title: "Save")
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
        viewModel.changeHeight = false
    }
}

#Preview {
    UpdateHeightUserView(viewModel: ProfileViewModel())
}
