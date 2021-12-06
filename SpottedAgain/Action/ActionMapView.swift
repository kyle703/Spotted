//
//  ActionMapView.swift
//  SpottedAgain
//
//  Created by Kyle Thompson on 11/23/21.
//
import MapKit
import SwiftUI

struct ActionMapView: View {
    @EnvironmentObject var game: Game
    @State var selectedPlace: MKPointAnnotation?
    @State var showingDetails: Bool = false
    
    
    var body: some View {
        MapView(selectedPlace: $selectedPlace, showingPlaceDetails: $showingDetails, annotations: game.annotations)
            .ignoresSafeArea(edges: .top)
    }
}


//NavigationView {
//    MapView()
//    .navigationBarTitle("Map")
//}.tabItem { Label("Map", systemImage: "map") }
