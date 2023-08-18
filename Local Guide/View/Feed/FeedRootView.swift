//
//  FeedRootView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/18.
//

import SwiftUI

struct FeedRootView: View {
    
    @State private var selectedSegment = 0
    
    var body: some View {
        VStack {
                    Picker(selection: $selectedSegment, label: Text("")) {
                        Text("Nearby").tag(0)
                        Text("Popular").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    if selectedSegment == 0 {
                        LocationFeedView()
                    } else {
                        LikeFeedView()
                    }
                }
    }
}
