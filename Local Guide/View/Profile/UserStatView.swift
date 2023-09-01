//
//  UserStatView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/09/01.
//
import SwiftUI

struct UserStatView: View {
    let value: Int
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.system(size: 15, weight: .semibold))
        }
        .frame(width: 80, alignment: .center)
    }
}
