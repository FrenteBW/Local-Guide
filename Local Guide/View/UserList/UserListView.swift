//
//  UserListView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/15.
//

import SwiftUI

struct UserListView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<15) { _ in
                    UserCell()
                        .padding([.top, .leading, .trailing])
                }
            }
        }
    }
}

