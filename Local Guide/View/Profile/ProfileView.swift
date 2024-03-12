//
//  ProfileView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/15.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User) {
            self.user = user
            self.viewModel = ProfileViewModel(user: user)
        }
    
    var body: some View {
        VStack {
            ProfileHeaderView(viewModel: viewModel)
            
            Divider()
            Text("Your Posts")
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.gray)
                .padding([.top])
            Divider()

            ProfileCellView(config: .profile(user.id ?? ""))
        }.padding(.top)
    }
}
