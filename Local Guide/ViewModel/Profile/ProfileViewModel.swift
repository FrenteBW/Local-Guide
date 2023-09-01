//
//  ProfileViewModel.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/31.
//


import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
        fetchUserStats()
    }

    func fetchUserStats() {
        guard let uid = user.id else { return }
                
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
                            guard let posts = snapshot?.documents.count else { return }
                    
            self.user.stats = UserStats(posts: posts)
        }
    }
}
