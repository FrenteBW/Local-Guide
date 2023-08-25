//
//  FeedViewLikeModel.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/25.
//

import SwiftUI

class FeedViewLikeModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        COLLECTION_POSTS.order(by: "likes", descending: true).getDocuments { snapshot, _ in 
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
            
            print(self.posts)
        }
    }
}

