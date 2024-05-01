//
//  CurrentUserProfile.swift
//  SwiftUI-Tinder-Clone
//
//  Created by enesozmus on 27.04.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    @State private var showEditProfile: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                CurrentUserProfileHeaderView(user: user)
                    .onTapGesture { showEditProfile.toggle() }
                
                Section("Account Information") {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text(user.fullname)
                    }
                    HStack {
                        Text("Age")
                        Spacer()
                        Text("\(user.age)")
                    }
                }
                
                Section("Legal") {
                    Text("Terms of Service")
                }
                
                Section() {
                    Button("Logout") { }
                    Button("Delete Account") { }
                }
                .foregroundStyle(.red)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfile) {
                EditProfileView(user: user)
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users.last!)
}
