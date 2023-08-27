//
//  ProfileView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/15.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        VStack {
            ProfileHeaderView(user: user)
            
            Divider()
            Text("Your Posts")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.gray)
                .padding([.top])
            Divider()
                
            ScrollView {
                LazyVStack {
                    ForEach(0..<15) { _ in
                        ProfileCell()
                        Divider()
                    }
                }
            }
        }.padding(.top)
    }
}
