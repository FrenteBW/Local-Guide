//
//  MainTabView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/15.
//

import SwiftUI

struct MainTabView: View {
    let user: User
    
    @Binding var selectedIndex: Int
    
    var body: some View {
            NavigationView {
                TabView(selection: $selectedIndex) {
                    FeedRootView()
                        .onTapGesture {
                            selectedIndex = 0
                        }
                        .tabItem {
                            Image(systemName: "house")
                        }.tag(0)
                    
                    SearchView()
                        .onTapGesture {
                            selectedIndex = 1
                        }
                        .tabItem {
                            Image(systemName: "person.3")
                        }.tag(1)
                    
                    UploadPostView(tabIndex: $selectedIndex)
                        .onTapGesture {
                            selectedIndex = 2
                        }
                        .tabItem {
                            Image(systemName: "plus.square")
                        }.tag(2)
                    
                    NotificationView()
                        .onTapGesture {
                            selectedIndex = 3
                        }
                        .tabItem {
                            Image(systemName: "heart")
                        }.tag(3)
                    
                    
                    ProfileView(user: user)
                        .onTapGesture {
                            selectedIndex = 4
                        }
                        .tabItem {
                            Image(systemName: "person")
                        }.tag(4)
                     
                }
                .navigationTitle(tabTitle)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: logoutButton)
                .accentColor(.black)
            }
    }
        
        var logoutButton: some View {
            Button {
                AuthViewModel.shared.signout() //AuthViewModel에 접근하는 다른 방법(shared이용)
            } label: {
                Text("Logout").foregroundColor(.black)
            }
        }
        
        var tabTitle: String {
            switch selectedIndex {
            case 0: return "Feed"
            case 1: return "Local guide"
            case 2: return "New Post"
            case 3: return "Notifications"
            case 4: return "Profile"
            default: return ""
            }
        }
}
