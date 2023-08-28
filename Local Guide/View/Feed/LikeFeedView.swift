//
//  LikeFeedView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/18.
//

import SwiftUI

struct LikeFeedView: View {
    
    @ObservedObject var viewModel = FeedViewLikeModel()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.posts) { post in
                    FeedCell(viewModel: FeedCellViewModel(post: post))
                        .padding([.top, .leading, .trailing])
                }
            }
        }
    }
}
