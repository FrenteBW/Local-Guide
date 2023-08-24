//
//  ProfileHeaderView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/16.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    let user: User
    var body: some View {
        HStack {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            VStack(alignment: .leading){
                Text(user.username)
                    .font(.system(size: 25, weight: .semibold))
                    .padding(.leading)
                
                Text(user.fullname)
                    .font(.system(size:15, weight: .medium))
                    .foregroundColor(.gray)
                    .padding(.leading)
            }
            
            ProfileBadge()
            Spacer()
        }
        .padding(.leading)
    }
}
