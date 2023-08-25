//
//  UploadPostView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/15.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPresented = false
    @Binding var tabIndex: Int
    @ObservedObject var viewModel = UploadPostViewModel()
    
    //추가
    @StateObject private var locationDataManager = LocationDataManager()
    @StateObject private var uploadViewModel = UploadPostViewModel()
    
    var body: some View {
        VStack {
            if postImage == nil {
                Button(action: { imagePickerPresented.toggle() }, label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 56)
                        .foregroundColor(.blue)
                }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: { ImagePicker(image: $selectedImage)
                })
                Text("Upload your new post!")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.blue)
                    .padding()
                    
            } else if let image = postImage {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    Divider()
                        .frame(maxHeight: 150)
                    
                    TextArea(text: $captionText, placeholder: "Enter your caption...")
                        .frame(height: 150)
                }.padding([.top, .leading,. trailing])
                
                HStack(spacing: 15) {
                    
                    Button(action: {
                        captionText = ""
                        postImage = nil
                    }, label: {
                        Text("Cancel")
                            .font(.system(size:16, weight:.semibold))
                            .frame(width: 172, height: 50)
                            .background(Color.gray)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    })
                    
                    Button(action: {
                        if let image = selectedImage {
                            //추가
                            let latitude = locationDataManager.locationManager.location?.coordinate.latitude ?? 0
                            let longitude = locationDataManager.locationManager.location?.coordinate.longitude ?? 0
                            //추가
                            viewModel.upload(caption: captionText, image: image, latitude: latitude, longitude: longitude) { _ in
                                captionText = ""
                                postImage = nil
                                tabIndex = 0
                            }
                        }
                    }, label: {
                        Text("Share")
                            .font(.system(size:16, weight:.semibold))
                            .frame(width: 172, height: 50)
                            .background(Color.gray)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    })
                }.padding()
                
                Divider()
                
                Text("When you upload a post, the user's current location will automatically appear as a map with the post.")
                    .padding()
            }
            
            Spacer()
        }
    }
}


extension UploadPostView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}
