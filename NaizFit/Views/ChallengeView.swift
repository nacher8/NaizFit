//
//  ChallengeView.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 25/1/24.
//

import SwiftUI

// A view with the Challenge information.
struct ChallengeView: View {
    var body: some View {
        VStack {
            Text("Challenges")
                .font(.custom("MontserratRoman-Regular", size: 20 ))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}

#Preview {
    ChallengeView()
}
