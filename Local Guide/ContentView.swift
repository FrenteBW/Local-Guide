//
//  ContentView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/15.
//

import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 0
    var body: some View {
        MainTabView(selectedIndex: $selectedIndex)
    }
}
