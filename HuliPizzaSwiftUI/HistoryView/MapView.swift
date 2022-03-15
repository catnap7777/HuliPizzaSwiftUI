//
//  MapView.swift
//  HuliPizzaSwiftUI
//
//  Created by Karen Mathes on 3/15/22.
//

import SwiftUI
//.. need MapKit
import MapKit

//.. not using MapView: View here
//struct MapView: View {
//.. instead use UIViewRepresentable...
struct MapView: UIViewRepresentable {
    //.. comment out body bc don't need it with map here
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
    
    var latitude: Double
    var longitude: Double
    var regionRadius: Double   //.. how far zooming in or out of map
    
    //.. need two functions with UIViewRepresentable
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    //.. sets the size of the map and pops a pin in where the pizza restuarant is located
    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        view.setRegion(MKCoordinateRegion(center: coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius),animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        view.addAnnotation(annotation)
    }
    
}


//.. previews don't work well with maps
//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
