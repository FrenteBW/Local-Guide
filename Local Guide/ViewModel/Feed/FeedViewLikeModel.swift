//
//  FeedViewLikeModel.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/25.
//

import SwiftUI
import CoreLocation

class FeedViewLikeModel: ObservableObject {
    @Published var posts = [Post]()
    @ObservedObject var locationDataManager = LocationDataManager()
    
    init() {
        fetchPosts(latitude: locationDataManager.latitude, longitude: locationDataManager.longitude)
    }
    
    func fetchPosts(latitude: Double, longitude: Double) {
        let radiusInKm = 0.1 // Adjust this radius as needed

        COLLECTION_POSTS.order(by: "likes", descending: true).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
                .filter { post in
                    let postLocation = CLLocation(latitude: post.latitude, longitude: post.longitude)
                    let userLocation = CLLocation(latitude: latitude, longitude: longitude)
                    let distance = postLocation.distance(from: userLocation) / 1000 // Convert to km
                    
                    return distance <= radiusInKm
                }
            
            print(self.posts)
        }
    }
}


