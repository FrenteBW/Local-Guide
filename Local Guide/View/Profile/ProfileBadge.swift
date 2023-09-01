//
//  ProfileBadge.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/16.
//

import SwiftUI

struct ProfileBadge: View {
    
    @State var BadgePresented = false
    let value: Int
    
    var body: some View {
        Button(action: { BadgePresented.toggle() }, label: {
            if value >= 5 {
                ZStack {
                    Circle()
                        .opacity(0.3)
                        .foregroundColor(.pink)
                        .frame(width: 50, height: 50)
                    VStack {
                        Text("🙋‍♂️")
                            .font(.system(size: 20))
                        Text("Local guide")
                            .font(.system(size: 6, weight: .semibold))
                            .foregroundColor(.blue)
                    }
                }
            }
        }
               
        ).sheet(isPresented: $BadgePresented, content: { BadgeDescription() }
        )}
}
