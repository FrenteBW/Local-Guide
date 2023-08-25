//
//  LocationFeedView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/18.
//

import SwiftUI

struct LocationFeedView: View {
    //@StateObject var locationDataManager = LocationDataManager()
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post)
                        .padding([.top, .leading, .trailing])
                }
            }
        }
    }
}

