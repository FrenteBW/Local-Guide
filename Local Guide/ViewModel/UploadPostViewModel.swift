//
//  UploadPostViewModel.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/24.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    
    func upload(caption: String, image: UIImage) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
            let data = ["caption": caption,
                        "timestamp": Timestamp(date: Date()),
                        "likes": 0,
                        "imageUrl": imageUrl,
                        "ownerUid": user.id ?? "",
                        "ownerImageUrl": user.profileImageUrl,
                        "ownerUserName": user.username,
                        //추가
                        "latitude": 0,
                        "longitude": 0
            ] as [String: Any]
            
            COLLECTION_POSTS.addDocument(data: data)

        }
    }
}
