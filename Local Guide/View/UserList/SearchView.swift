//
//  SearchView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/23.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        
        ScrollView{
            
            ZStack {
                UserListView(viewModel: viewModel)
            }
        }
    }
}

