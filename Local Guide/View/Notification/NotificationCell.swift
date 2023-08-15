//
//  NotificationCell.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/15.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        HStack {
            Image("IMG_0119")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                    
            Text("Byungwook An").font(.system(size: 14, weight: .semibold))
            Text("Harin like your post").font(.system(size: 15))
            Text(" 2d").foregroundColor(.gray).font(.system(size: 12))
        }
    }
}
