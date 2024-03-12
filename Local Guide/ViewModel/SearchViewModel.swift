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
        COLLECTION_USERS.getDocuments { snapshot, _ in
                        guard let documents = snapshot?.documents else { return }
                        self.users = documents.compactMap({ try? $0.data(as: User.self) })
                    }
    }
}
