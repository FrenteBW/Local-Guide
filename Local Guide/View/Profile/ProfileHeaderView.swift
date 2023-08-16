//
//  ProfileHeaderView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/16.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        HStack {
            Image("IMG_0119")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            VStack(alignment: .leading){
                Text("FrenteBW")
                    .font(.system(size: 25, weight: .semibold))
                    .padding([.leading, .top])
                
                Text("Byungwook An")
                    .font(.system(size:15))
                    .padding(.leading)
                
                ProfileBadge()
                    .padding(.leading)
            }
            
        }.padding(.trailing, 100) //수정 필요
    }
}
