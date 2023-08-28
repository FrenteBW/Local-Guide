//
//  ProfileCellView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/16.
//

import SwiftUI
import Kingfisher

struct ProfileCellView: View {
    let config: PostGridConfiguration
    
    @ObservedObject var viewModel: ProfileCellViewModel
    
    init(config: PostGridConfiguration) {
            self.config = config
            self.viewModel = ProfileCellViewModel(config: config)
        }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.posts) { post in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(post.ownerUserName)
                                .font(.system(size: 15, weight: .semibold))
                            
                            Text(post.caption)
                                .font(.system(size: 15))
                        }
                        
                        Spacer()
                        
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                    .padding([.leading, .trailing])
                }
            }
        }
    }
}
