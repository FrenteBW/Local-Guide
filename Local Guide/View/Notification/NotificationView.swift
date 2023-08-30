//
//  NotificationView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/15.
//

import SwiftUI

struct NotificationView: View {
    @ObservedObject var viewModel = NotificationsViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(viewModel.notifications) { notification in
                    NotificationCell(viewModel: NotificationCellViewModel(notification: notification))
                        .padding([.top, .trailing])
                }
            }
        }
    }
}
