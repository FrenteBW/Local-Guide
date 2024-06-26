//
//  FeedCell.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/15.
//

import SwiftUI
import MapKit
import Kingfisher

struct FeedCell: View {
    
    @ObservedObject var viewModel: FeedCellViewModel
    
    var didLike: Bool { return viewModel.post.didLike ?? false }
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }
    
    @State var BadgePresented = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            //게시자 프로필 사진 + ID
                HStack {
                    KFImage(URL(string: viewModel.post.ownerImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .clipped()
                        .cornerRadius(18)
                    
                    Text(viewModel.post.ownerUserName)
                        .font(.system(size: 14, weight: .semibold))
                }
                .padding([.leading, .bottom], 5)
            
                //게시글 이미지
            KFImage(URL(string: viewModel.post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 340, height: 300, alignment: .center)
                    .clipped()
            
            HStack {
                
                Button(action: { BadgePresented.toggle() }, label: {
                    MapView(coordinate: CLLocationCoordinate2D(latitude: viewModel.post.latitude, longitude: viewModel.post.longitude))
                }
                ).sheet(isPresented: $BadgePresented, content: { WholeMapView(viewModel: viewModel) }
                )
                
                    .frame(width: 240, height: 100, alignment: .center)
                //추천 등급 랭킹 마크
                FeedBadge(value: viewModel.post.likes)
                    .frame(width: 80, height: 80, alignment: .center)
            }
                    
            //하트 + 말풍선
            HStack(spacing: 16) {
                Button(action: {
                    didLike ? viewModel.unlike() : viewModel.like()
                }, label: {
                    Image(systemName:didLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(didLike ? .red : .black)
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                })
                
                NavigationLink(destination: CommentsView(post: viewModel.post)) {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(4)
                }
                .padding(.leading, 4)
                .foregroundColor(.black)
            }
            //라이크, 코멘트, 날짜
            Text(viewModel.likeString)
                    .font(.system(size: 14, weight: .semibold))
                    .padding(.leading, 8)
                    .padding(.bottom, 2)
                
                HStack {
                    Text(viewModel.post.ownerUserName).font(.system(size: 14, weight: .semibold))
                    Text("\(viewModel.post.caption)").font(.system(size: 15))
                        .lineLimit(1)
                }.padding(.horizontal, 8)
                
                Text(viewModel.timestampString)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.leading, 8)
                    .padding(.top, 2)
        }
    }
}
