//
//  LoginView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/15.
//

import SwiftUI
import BWTextField

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
            NavigationView {
                ZStack {
                    Color("background")
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        Spacer()
                        Text("Login")
                            .foregroundColor(.gray)
                            .font(.system(size: 35, weight: .semibold))
                        
                        VStack(spacing: 20) {
                            BWTextField(imageName: "person.circle", placeholderText: "Write your ID", isSecureField: false, text: $email)
                                .padding([.top, .leading, .trailing])
                            
                            BWTextField(imageName: "person.circle", placeholderText: "Write your Password", isSecureField: true, text: $password)
                                .padding([.bottom, .leading, .trailing])
                        }
                        
                        HStack {
                            Spacer()
                            
                            NavigationLink(
                                destination: ResetPasswordView(),
                                label: {
                                    Text("Forgot password?")
                                        .font(.system(size: 13, weight: .semibold))
                                        .foregroundColor(.gray)
                                        .padding(.top)
                                        .padding(.trailing, 20)
                                })
                        }
                        
                        Button(action: {
                            viewModel.login(withEmail: email, password: password)
                        }, label: {
                            Text("Sign In")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 360, height: 50)
                                .background(Color.blue)
                                .clipShape(Capsule())
                                .padding()
                        })
                        
                        Spacer()
                        
                        NavigationLink(
                            destination: RegistrationView().navigationBarHidden(true), label: {
                                HStack {
                                    Text("Don't have an account")
                                        .font(.system(size: 14))
                                    
                                    Text("Sign up")
                                        .font(.system(size: 14, weight: .semibold))
                                }.foregroundColor(.gray)
                            }).padding(.bottom, 16)
                        
                    }
                    .padding(.top, -44)
                }
            }
        }
}
