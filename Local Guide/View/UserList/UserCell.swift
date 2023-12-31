//
//  UserCell.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/15.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    
    var body: some View {

            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(user.fullname)
                    .font(.system(size: 14))
            }
            
            Spacer()
    }
}
