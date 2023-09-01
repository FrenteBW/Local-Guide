//
//  FeedBadge.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/29.
//

import SwiftUI

struct FeedBadge: View {
    
    @State var BadgePresented = false
    let value: Int
    
    var body: some View {
        Button(action: { BadgePresented.toggle() }, label: {
            if value >= 2 {
                ZStack {
                    Circle()
                        .opacity(0.3)
                        .foregroundColor(.pink)
                        .frame(width: 80, height: 80)
                    VStack {
                        Text("🙋‍♂️")
                            .font(.system(size: 30))
                        Text("Hot place")
                            .font(.system(size: 10, weight: .semibold))
                            .foregroundColor(.blue)
                    }
                }
            }
            else {
                ZStack {
                    Circle()
                        .opacity(0.3)
                        .foregroundColor(.yellow)
                        .frame(width: 80, height: 80)
                    VStack {
                        Text("🙋‍♂️")
                            .font(.system(size: 30))
                        Text("nice place")
                            .font(.system(size: 10, weight: .semibold))
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        ).sheet(isPresented: $BadgePresented, content: { Text("About Feed badge...") }
        )}
}

