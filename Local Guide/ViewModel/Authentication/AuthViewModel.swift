//
//  AuthViewModel.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/22.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User? //얘가 nil이면, ContentView에서 Login View로 넘어감
    @Published var currentUser: User?
    
    static let shared = AuthViewModel() // 어디서든 AuthViewModel에 접근하도록
    
    init() {
        userSession = Auth.auth().currentUser //Firebase에서 userSession이 nil인지 아닌지 판단 후 전송, userSession 먼저 만들고 FetchUser 함
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let error = error {
                    print("DEBUG: Login failed")
                    return
                }
                
                guard let user = result?.user else { return }
                self.userSession = user
                print("Sucessfully Login...")
                self.fetchUser()
            }
        }

    func register(withEmail email: String, password: String, image: UIImage?, fullname: String, username: String) {
            guard let image = image else { return }
            
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    
                    guard let user = result?.user else { return }
                    //self.userSession = user
                    print("Sucessfully registered user...")
                    
                    let data = ["email": email,
                                "username": username,
                                "fullname": fullname,
                                "profileImageUrl": imageUrl,
                                "uid": user.uid]
                    
                    COLLECTION_USERS.document(user.uid).setData(data) { _ in //database에 데이터 업로드
                        print("Successfully uploaded user data...")
                        self.userSession = user
                        self.fetchUser()
                    }
                }
            }
        }
    
    func signout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in //Firebase Database에 접근하는 root
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
}
