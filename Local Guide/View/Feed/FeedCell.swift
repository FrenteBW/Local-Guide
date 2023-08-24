//
//  FeedCell.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/15.
//

import SwiftUI
import MapKit

struct FeedCell: View {

    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5666791, longitude: 126.9782914), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            //게시자 프로필 사진 + ID
                HStack {
                    Image("IMG_0119")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .clipped()
                        .cornerRadius(18)
                    
                    Text("FrenteBW")
                        .font(.system(size: 14, weight: .semibold))
                }
                .padding([.leading, .bottom], 5)
            
            //게시글 이미지
                Image("IMG_0119")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 340, height: 220, alignment: .center)
                    .clipped()
            
                Map(coordinateRegion: $region)
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
                Text("50 Likes")
                    .font(.system(size: 14, weight: .semibold))
                    .padding(.leading, 8)
                    .padding(.bottom, 2)
                
                HStack {
                    Text("FrenteBW").font(.system(size: 14, weight: .semibold))
                    Text("Amazing EQ kuala lumpur!").font(.system(size: 15))
                }.padding(.horizontal, 8)
                
                Text("3d")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.leading, 8)
                    .padding(.top, 2)
        }
    }
}

