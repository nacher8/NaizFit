//
//  MeetingView.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 25/1/24.
//

import SwiftUI

struct MeetingView: View {
    @State private var isAuthenticating = false
        @State private var username = ""
        @State private var password = ""
    
    var body: some View {
        VStack {
            Text("Meetings")
                .font(.custom("MontserratRoman-Regular", size: 20 ))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}

#Preview {
    MeetingView()
}
