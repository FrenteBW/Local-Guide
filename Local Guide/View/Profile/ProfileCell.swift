//
//  ProfileCell.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/16.
//

import SwiftUI

struct ProfileCell: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("EQ Kuala lumpur")
                    .font(.system(size: 15, weight: .semibold))
                
                Text("Best hotel in KL! Awesome.")
                    .font(.system(size: 15))
            }
            
            Spacer()
            
            Image("IMG_0021")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
        .padding([.leading, .trailing])
    }
}
