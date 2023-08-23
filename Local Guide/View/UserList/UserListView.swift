//
//  UserListView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/15.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.users) { _ in
                    UserCell()
                        .padding([.top, .leading, .trailing])
                }
            }
        }
    }
}

