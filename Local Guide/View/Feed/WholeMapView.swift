//
//  WholeMapView.swift
//  Local Guide
//
//  Created by 안병욱의 mac on 2023/09/01.
//

import SwiftUI
import MapKit

struct WholeMapView: View {
    @ObservedObject var viewModel: FeedCellViewModel
    var body: some View {
        VStack{
            MapView(coordinate: CLLocationCoordinate2D(latitude: viewModel.post.latitude, longitude: viewModel.post.longitude))
        }.presentationDetents([.fraction(0.8), .large])
    }
}

