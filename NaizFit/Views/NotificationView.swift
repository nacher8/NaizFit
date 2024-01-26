//
//  NotificationView.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 25/1/24.
//

import SwiftUI

// A view with the Notification information.
struct NotificationView: View {
    var body: some View {
        VStack {
            Text("Notifications")
                .font(.custom("MontserratRoman-Regular", size: 20 ))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}

#Preview {
    NotificationView()
}
