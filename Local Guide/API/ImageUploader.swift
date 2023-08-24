//
//  ImageUploader.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/22.
//

import UIKit
import Firebase
//추가
import FirebaseStorage

enum UploadType {
    case profile
    case post
    
    var filePath: StorageReference {
        let filename = NSUUID().uuidString
        switch self {
        case .profile:
            return Storage.storage().reference(withPath: "/profile_images/\(filename)")
        case .post:
            return Storage.storage().reference(withPath: "/post_images/\(filename)")
        }
    }
}

struct ImageUploader {
    static func uploadImage(image: UIImage, type: UploadType, completion: @escaping(String) -> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        //let filename = NSUUID().uuidString
        //let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        let ref = type.filePath
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: failed to upload image \(error.localizedDescription)")
                return
            }
            
            print("Successfully uploaded image...")
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
