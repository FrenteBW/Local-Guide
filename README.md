# Local-Guide


![스크린샷 2023-09-03 오후 5 07 31](https://github.com/FrenteBW/Local-Guide/assets/88021794/4ff2753e-811a-49ae-be2d-9588264f5525)

### 소개

 사용자의 위치 정보를 바탕으로, 근처에 있는 맛집, 관광명소 등에 대한 정보를 제공하는 플랫폼입니다.

 사용자가 정보를 얻고자 할 때, 현재 위치 근처에서 다른 유저에 의해 업로드된 맛집, 관광명소 등에 대한 Post를 볼 수 있습니다.

 사용자가 소개하고자 하는 맛집, 관광명소에 관한 Post를 게시할 때, 사용자의 현재 위치가 자동으로 데이터베이스에 업로드되어 타인이 해당 위치 근처에서 앱에 접속 시 게시한 포스트가 나타납니다.

 앱의 기획, 구현, 테스트까지 혼자 진행한 개인 프로젝트입니다.

### 사용한 기술

 SwiftUI를 사용해 앱을 개발했습니다.

 MVVM 패턴을 적용했습니다.

 Firebase를 활용해  사용자 Authentication 기능과 Database를 구축하여 사용했습니다.

 MapKit을 활용해 위치 정보를 지도로 표현하는 기능을 구현했습니다.

### Key point
  사용자의 위치 정보를 받고, 사용자의 현재 위치 주변에 대한 정보(맛집, 관광명소 등)를 제공하는 것이 플랫폼의 목표였습니다. 그러기 위해선 사용자가 Post를 업로드할 때 사용자의 위치를 데이터 베이스에 함께 자동으로 저장하고, 이 데이터를 활용해 Post를 불러올 수 있는 알고리즘이 필요했습니다.

  이를 위해 사용자의 현재 위치 정보를 위도, 경도로 표현해 Post가 업로드될 때 이 데이터가 자동으로 데이터베이스에 업로드 되도록 구현했습니다. 더불어 사용자가 현재 위치 주변에 대한 정보를 불러올 때는, 사용자의 현재 위치 정보를 바탕으로 일정 거리 내에 있는 Post 데이터만 필터링해 불러올 수 있도록 구현했습니다.

  이를 통해 사용자의 위치 정보를 목적에 맞게 활용할 수 있는 방법을 배웠고, 위치 정보를 Map kit과 연동해 지도를 활용할 수 있는 방법을 배웠습니다.

  위 부분에 대한 코드는 깃허브 링크 Read me에서 볼 수 있습니다.

### 핵심코드
    //현재 위치로부터 일정 거리 내에서 업로드된  Post filtering 하기
    func fetchPosts(latitude: Double, longitude: Double) {
        let radiusInKm = 0.1 

        COLLECTION_POSTS.order(by: "timestamp", descending: true).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
                .filter { post in
                    let postLocation = CLLocation(latitude: post.latitude, longitude: post.longitude)
                    let userLocation = CLLocation(latitude: latitude, longitude: longitude)
                    let distance = postLocation.distance(from: userLocation) / 1000 // Convert to km
                    
                    return distance <= radiusInKm
                }
        }
    }

    //위치 데이터를 함께 데이터베이스에 업로드 하기
    func upload(caption: String, image: UIImage, latitude: Double, longitude: Double, completion: FirestoreCompletion) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
                    let data = ["caption": caption,
                                "timestamp": Timestamp(date: Date()),
                                "likes": 0,
                                "imageUrl": imageUrl,
                                "ownerUid": user.id ?? "",
                                "ownerImageUrl": user.profileImageUrl,
                                "ownerUserName": user.username,
                                //위치 정보 추가(latitude, longitude)
                                "latitude": latitude,
                                "longitude": longitude
                    ] as [String: Any]
                    
            COLLECTION_POSTS.addDocument(data: data, completion: completion)

                }
            }
        }


    

### 배운점

 Firebase를 이용해 사용자의 정보, Post의 정보 등의 데이터를 전송하고, Fetch 하는 방법을 배웠습니다. 

 사용자의 위치 정보 데이터(위도, 경도)를 받아 이를 활용하는 방법을 배웠습니다. 

 Map Kit을 활용하는 방법을 배웠습니다.

 MVVM 패턴을 자유롭게 활용할 수 있게 되었습니다. 

### 시연 영상

https://youtu.be/SlGoFvkdoPw?si=I6JQzAhBE6p1Szyp
