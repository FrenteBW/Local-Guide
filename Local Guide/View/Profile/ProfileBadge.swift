//
//  ProfileBadge.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/16.
//

import SwiftUI

struct ProfileBadge: View {
    @State var BadgePresented = false
    var body: some View {
        Button(action: { BadgePresented.toggle() }, label: {
            Text("Local guide🙋‍♂️")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.blue)
        }).sheet(isPresented: $BadgePresented, content: { BadgeDescription() }
        )}
}

