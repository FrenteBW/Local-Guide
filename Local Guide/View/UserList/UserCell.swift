//
//  UserCell.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/15.
//

import SwiftUI

struct UserCell: View {
    
    var body: some View {
        HStack {
            Image("IMG_0119")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("Byungwook An")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("FrenteBW")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}
