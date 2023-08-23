//
//  SearchViewModel.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/23.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in //User Data 들 불러오기
            guard let documents = snapshot?.documents else { return }
            self.users = documents.compactMap({ try? $0.data(as: User.self) })
        }
    }
    
    /*
    func filteredUsers(_ query: String) -> [User] { //검색창에 알파벳 입력 시 알파벳과 일치하는 사용자 나타냄
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.fullname.lowercased().contains(lowercasedQuery) || $0.username.contains(lowercasedQuery) })
    }
     */
}
