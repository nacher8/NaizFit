//
//  ContentView.swift
//  NaizFit
//
//  Created by IGNACIO HERNAIZ IZQUIERDO on 25/1/24.
//

import SwiftUI

var tabs = ["Challenge", "Meeting", "Notification", "Profile"]

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TabView {
                ChallengeView()
                    .tabItem {
                        Image("Challenge")
                            .renderingMode(.template)
                        Text("Challenges")
                            .foregroundStyle(.lightGrey)
                    }
                MeetingView()
                    .tabItem {
                        Image("Meeting")
                            .renderingMode(.template)
                        Text("Meeting")
                            .foregroundStyle(.lightGrey)
                    }
                NotificationView()
                    .tabItem {
                        Image("Notification")
                            .renderingMode(.template)
                        Text("Notifications")
                            .foregroundStyle(.lightGrey)
                    }
                ProfileView()
                    .tabItem {
                        Image("Profile")
                            .renderingMode(.template)
                        Text("Profile")
                            .foregroundStyle(.lightGrey)
                    }
            }
            .onAppear() {
                UITabBar.appearance().backgroundColor = .black
                UITabBar.appearance().unselectedItemTintColor = .lightGrey
            }
            .tint(.orange)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image("Menu")
                            .renderingMode(.template)
                            .foregroundStyle(Color.black)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image("Notification")
                            .renderingMode(.template)
                            .foregroundStyle(Color.black)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
