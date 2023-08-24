//
//  UploadPostViewModel.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/24.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    
    @StateObject var locationDataManager = LocationDataManager()
    
    func upload(caption: String, image: UIImage) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        //여기에 추가
        switch locationDataManager.locationManager.authorizationStatus {
        case .authorizedWhenInUse:  // Location services are available.
            ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
                let data = ["caption": caption,
                            "timestamp": Timestamp(date: Date()),
                            "likes": 0,
                            "imageUrl": imageUrl,
                            "ownerUid": user.id ?? "",
                            "ownerImageUrl": user.profileImageUrl,
                            "ownerUserName": user.username,
                            //추가
                            "latitude": self.locationDataManager.locationManager.location?.coordinate.latitude.description ?? 0,
                            "longitude": self.locationDataManager.locationManager.location?.coordinate.longitude.description ?? 0
                ] as [String: Any]
                
                COLLECTION_POSTS.addDocument(data: data)
                
            }
            
        case .restricted, .denied, .notDetermined:  // Location services currently unavailable.
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
            
        default:
            
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
}
