//
//  LocationFeedView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/18.
//

import SwiftUI

struct LocationFeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<15) { _ in
                    FeedCell()
                        .padding([.top, .leading, .trailing])
                }
            }
        }
    }
}

