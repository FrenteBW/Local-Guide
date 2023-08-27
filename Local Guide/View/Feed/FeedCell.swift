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
    
    let post: Post

    //@State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3212890625, longitude: 127.12713440293922), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            //게시자 프로필 사진 + ID
                HStack {
                    KFImage(URL(string: post.ownerImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .clipped()
                        .cornerRadius(18)
                    
                    Text(post.ownerUserName)
                        .font(.system(size: 14, weight: .semibold))
                }
                .padding([.leading, .bottom], 5)
            
                //게시글 이미지
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 340, height: 220, alignment: .center)
                    .clipped()
            
                //Map(coordinateRegion: $region)
                MapView(coordinate: CLLocationCoordinate2D(latitude: post.latitude, longitude: post.longitude))
                    .frame(width: 340, height: 220, alignment: .center)
                    
            //하트 + 말풍선
                HStack(spacing: 16) {
                    Button(action: {}, label: {
                        Image(systemName:"heart.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .font(.system(size: 20))
                            .padding(4)
                    })
                    
                    Button(action: {}, label: {
                        Image(systemName: "bubble.right")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 20, height: 20)
                            .font(.system(size: 20))
                            .padding(4)
                    })
                }
                .padding(.leading, 4)
                .foregroundColor(.black)
            
            //라이크, 코멘트, 날짜
            Text("\(post.likes) likes")
                    .font(.system(size: 14, weight: .semibold))
                    .padding(.leading, 8)
                    .padding(.bottom, 2)
                
                HStack {
                    Text(post.ownerUserName).font(.system(size: 14, weight: .semibold))
                    Text("\(post.caption)").font(.system(size: 15))
                }.padding(.horizontal, 8)
                
                Text("2d")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.leading, 8)
                    .padding(.top, 2)
        }
    }
}
