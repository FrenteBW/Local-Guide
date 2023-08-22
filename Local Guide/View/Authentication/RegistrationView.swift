//
//  RegistrationView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/15.
//

import SwiftUI
import BWTextField

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var username = ""
    @State private var password = ""
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State var imagePickerPresented = false
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            Color("background")
            .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Spacer()
                Text("Registration")
                    .foregroundColor(.gray)
                    .font(.system(size: 35, weight: .semibold))
                ZStack {
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    } else {
                        Button(action: { imagePickerPresented.toggle() }, label: {
                            Image(systemName: "plus.circle")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: { ImagePicker(image: $selectedImage)
                        })
                    }
                }
                
                VStack(spacing: 20) {
                    BWTextField(imageName: "person.circle", placeholderText: "Write your ID", isSecureField: false, text: $email)
                        .padding([.top, .leading, .trailing])
                    
                    BWTextField(imageName: "envelope", placeholderText: "Username", isSecureField: false, text: $username)
                        .padding([.leading, .trailing])
                    
                    BWTextField(imageName: "person", placeholderText: "Fullname", isSecureField: false, text: $fullname)
                        .padding([.leading, .trailing])
                    
                    BWTextField(imageName: "person.circle", placeholderText: "Write your Password", isSecureField: true, text: $password)
                        .padding([.bottom, .leading, .trailing])
                }
                
                
                
                Button(action: {
                    viewModel.register(withEmail: email, password: password, image: selectedImage, fullname: fullname, username: username)
                }, label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                })
                
                Spacer()
                
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    HStack {
                        Text("Already have an account")
                            .font(.system(size: 14))
                        
                        Text("Sign in")
                            .font(.system(size: 14, weight: .semibold))
                    }.foregroundColor(.gray)
                })
            }
        }
    }
}

extension RegistrationView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        image = Image(uiImage: selectedImage)
    }
}
