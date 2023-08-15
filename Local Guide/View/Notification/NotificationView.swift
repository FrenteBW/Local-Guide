//
//  NotificationView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/15.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<15) { _ in
                    NotificationCell()
                        .padding([.top, .trailing])
                }
            }
        }
    }
}
