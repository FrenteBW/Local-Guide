//
//  ProfileCellViewModel.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/25.
//

import SwiftUI

enum PostGridConfiguration {
    case profile(String) //누구의 게시글인지 분류할 때 사용 가능, 해시태그 등의 기능을 만들 때도 활용 가능(43강 참고)
}


class ProfileCellViewModel: ObservableObject {
    @Published var posts = [Post]()
    let config: PostGridConfiguration
        
        init(config: PostGridConfiguration) {
            self.config = config
            fetchPosts(forConfig: config)
        }
    
    func fetchPosts(forConfig config: PostGridConfiguration) {
            switch config {
            case .profile(let uid):
                fetchUserPosts(forUid: uid)
            }
        }
    
    func fetchUserPosts(forUid uid: String) {
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid)
                    .getDocuments { snapshot, _ in
                    guard let documents = snapshot?.documents else { return }
                        let posts = documents.compactMap({ try? $0.data(as: Post.self) })
                        self.posts = posts.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
                }
    }
    
}
