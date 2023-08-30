//
//  NotificationCell.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/15.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @ObservedObject var viewModel: NotificationCellViewModel
    
    init(viewModel: NotificationCellViewModel) {
            self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            if let user = viewModel.notification.user {
                NavigationLink(destination: ProfileView(user: user)) {
                    KFImage(URL(string: viewModel.notification.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                            
                    Text(viewModel.notification.username).font(.system(size: 14, weight: .semibold))
                    Text(viewModel.notification.type.notificationMessage).font(.system(size: 15))
                    //Text(" 3m").foregroundColor(.gray).font(.system(size: 12))
                }
            }
            Spacer()
            
            if let post = viewModel.notification.post {
                NavigationLink(destination: FeedCell(viewModel: FeedCellViewModel(post: post))) {
                    KFImage(URL(string: post.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipped()
                }
            }
        }
    }
}
