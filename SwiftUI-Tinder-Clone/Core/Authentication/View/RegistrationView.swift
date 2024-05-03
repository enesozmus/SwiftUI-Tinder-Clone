//
//  RegistrationView.swift
//  SwiftUI-Tinder-Clone
//
//  Created by enesozmus on 3.05.2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var fullname = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            // image
            Image(.tinderLogo)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .padding(.vertical, 32)
            
            // form fields
            VStack(spacing: 24) {
                InputView(
                    text: $email,
                    title: "Email Address",
                    placeholder: "name@example.com"
                )
                .autocapitalization(.none)
                InputView(
                    text: $fullname,
                    title: "Full Name",
                    placeholder: "Enter your name"
                )
                InputView(
                    text: $password,
                    title: "Password",
                    placeholder: "Enter your password"
                )
                InputView(
                    text: $confirmPassword,
                    title: "Confirm Password",
                    placeholder: "Confirm your password",
                    isSecureField: true
                )
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            // sign up button
            Button {
                
            } label: {
                HStack {
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color(.systemPink))
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            
            // back button
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
        }
    }
}

#Preview {
    RegistrationView()
}
