//
//  MapView.swift
//  Spotted
//
//  Created by Kyle Thompson on 10/4/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @State private var locations = [MKPointAnnotation]()
    var annotations: [MKPointAnnotation]

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        if annotations.count != uiView.annotations.count {
            uiView.removeAnnotations(uiView.annotations)
            uiView.addAnnotations(annotations)
        }
    }
    
    
    func makeCoordinator() -> MapView.Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
    }
    
    
//    var body: some View {
//        ZStack {
//            MapView(centerCoordinate: $centerCoordinate, annotations: locations)
//            Circle()
//                .fill(Color.blue)
//                .opacity(0.3)
//                .frame(width: 32, height: 32)
//            VStack {
//                Spacer()
//                HStack {
//                    Spacer()
//                    Button(action : {
//                        let newLocation = MKPointAnnotation()
//                        newLocation.coordinate = self.centerCoordinate
//                        self.locations.append(newLocation)
//                    }) {
//                        Image(systemName: "plus")
//                    }
//                    .padding()
//                    .background(Color.black.opacity(0.75))
//                    .foregroundColor(Color.white)
//                    .font(.title)
//                    .clipShape(Circle())
//                    .padding(.trailing)
//                }
//            }
//        }
//    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(centerCoordinate: .constant(MKPointAnnotation.example.coordinate), annotations: [MKPointAnnotation.example])
    }
}

extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "Richmond"
        annotation.subtitle = "Heffers"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 37.5407, longitude: -77.4360)
        return annotation
    }
}


