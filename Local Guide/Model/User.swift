//
//  User.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    @DocumentID var id: String? //
    //var bio: String?
    //var stats: UserStats?
    //var isFollowed: Bool? = false
    
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
}


//struct UserStats: Decodable {
    //var following: Int
    //var posts: Int
    //var followers: Int
//}
