//
//  Post.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/25.
//

import FirebaseFirestoreSwift
import Firebase //Timestamp를 위해

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUserName: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    let ownerImageUrl: String
    let latitude: Double
    let longitude: Double
    
    var didLike: Bool? = false
}
