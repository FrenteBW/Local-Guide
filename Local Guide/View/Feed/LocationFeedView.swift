//
//  LocationFeedView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/08/18.
//

import SwiftUI

struct LocationFeedView: View {
    @StateObject var locationDataManager = LocationDataManager()
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<15) { _ in
                    FeedCell()
                        .padding([.top, .leading, .trailing])
                    
                    switch locationDataManager.locationManager.authorizationStatus {
                                case .authorizedWhenInUse:  // Location services are available.
                                    // Insert code here of what should happen when Location services are authorized
                                    Text("Your current location is:")
                                    Text("Latitude: \(locationDataManager.locationManager.location?.coordinate.latitude.description ?? "Error loading")")
                                    Text("Longitude: \(locationDataManager.locationManager.location?.coordinate.longitude.description ?? "Error loading")")
                                    
                                case .restricted, .denied:  // Location services currently unavailable.
                                    // Insert code here of what should happen when Location services are NOT authorized
                                    Text("Current location data was restricted or denied.")
                                case .notDetermined:        // Authorization not determined yet.
                                    Text("Finding your location...")
                                    ProgressView()
                                default:
                                    ProgressView()
                                }
                }
            }
        }
    }
}

