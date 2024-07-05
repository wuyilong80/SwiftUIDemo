//
//  Chapter15MainView.swift
//  SwiftUIDemo
//
//  Created by Lawrence Wu 吳易隆 on 2024/7/5.
//

import SwiftUI

struct Chapter15MainView: View {
        
    @ObservedObject private var viewModel = Chapter15ViewModel()
    
    var body: some View {
        VStack {
            Text("Create an account")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .padding(.bottom, 30)
            
            FormField(fieldName: "Username", fieldValue: $viewModel.username)
            RequirementText(iconColor: viewModel.isUsernameLengthValid ? .secondary : Color(red: 251/255, green: 128/255, blue: 128/255), text: "A minimum of 4 characters", isStrikeThrough: viewModel.isUsernameLengthValid)
                .padding()
            
            FormField(fieldName: "Password", fieldValue: $viewModel.password, isSecure: true)
            VStack {
                RequirementText(iconName: "lock.open", iconColor: viewModel.isPasswordLengthValid ? .secondary : Color(red: 251/255, green: 128/255, blue: 128/255), text: "A minimum of 8 characters", isStrikeThrough: viewModel.isPasswordCapitalLetter)
                RequirementText(iconName: "lock.open", iconColor: viewModel.isPasswordConfirmValid ? .secondary : Color(red: 251/255, green: 128/255, blue: 128/255), text: "One uppercase letter", isStrikeThrough: viewModel.isPasswordCapitalLetter)
            }
            .padding()
            
            FormField(fieldName: "Confirm Password", fieldValue: $viewModel.passwordConfirm, isSecure: true)
            RequirementText(iconColor: viewModel.isPasswordConfirmValid ? .secondary : Color(red: 251/255, green: 128/255, blue: 128/255), text: "Your confirm password should be the same as password", isStrikeThrough: viewModel.isPasswordConfirmValid)
                .padding()
                .padding(.bottom, 50)
            
            Button(action: {
                // 進入下一個畫面
            }) {
                Text("Sign Up")
                    .font(.system(.body, design: .rounded))
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 251/255, green: 128/255, blue: 128/255), Color(red: 253/255, green: 193/255, blue: 104/255)]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
            }
            
            HStack {
                Text("Already have an account?")
                    .font(.system(.body, design: .rounded))
                    .bold()
                
                Button(action: {
                    // 進入登入畫面
                }) {
                    Text("Sign in")
                        .font(.system(.body, design: .rounded))
                        .bold()
                        .foregroundColor(Color(red: 251/255, green: 128/255, blue: 128/255))
                }
            }.padding(.top, 50)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    Chapter15MainView()
}
