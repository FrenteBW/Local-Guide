//
//  Notification.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/30.
//

import FirebaseFirestoreSwift
import Firebase

struct Notification: Identifiable, Decodable {
    @DocumentID var id: String?
    let postId: String?
    let username: String
    let profileImageUrl: String
    let timestamp: Timestamp
    let type: NotificationType
    let uid: String
    
    //var isFollowed: Bool? = false
    var post: Post?
    var user: User?
}

enum NotificationType: Int, Decodable {
    case like
    case comment
    //case follow
    
    var notificationMessage: String {
        switch self {
        case .like: return "liked one of your posts."
        case .comment: return "commented on one of your posts"
        //case .follow: return "started following you"
        }
    }
}
