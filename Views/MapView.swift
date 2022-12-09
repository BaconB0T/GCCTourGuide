//
//  MapView.swift
//  GCCTourGuide
//
//  Created by Tyler Ridout on 12/7/22.
//  Edited by Eric Sayre on 12/9/22

import SwiftUI

import MapKit

struct MyView1 : UIViewRepresentable{
    var name: String
    var region: MKCoordinateRegion
    var attraction: Attraction
    @Binding var showAttraction: Bool
    
//    init(name: String, region: MKCoordinateRegion, attraction: Attraction, showAttraction: Bool) {
//        self.name = name
//        self.region = region
//        self.attraction = attraction
//    }
    
    var point_of_interest: [MKPointAnnotation] {
        
        var locs = [MKPointAnnotation]()
        var loc = MKPointAnnotation()
        loc.coordinate = CLLocationCoordinate2D(latitude: region.center.latitude, longitude: region.center.longitude)
        loc.title = name
        
        locs.append(loc)
        
        
        return locs
    }
    
    // create
    func makeUIView(context: Context) -> MKMapView {
        // return MKMapView()
        var map = MKMapView()
        // map.addAnnotations(point_of_interest)
        map.delegate = context.coordinator
        return map
    }
    
    // update
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(point_of_interest)
        uiView.setRegion(region, animated: true)
    }
    
    // tear down
    static func dismantleUIView(_ uiView: MKMapView, coordinator: ()) {
        uiView.removeAnnotations(uiView.annotations)
    }
    
    // return the delegate
    func makeCoordinator() -> Coordinator {
        return Coordinator(map: self, attraction: attraction)
    }
    
    
    // delegate
    class Coordinator : NSObject, MKMapViewDelegate{
        
        var map : MyView1
        var attraction : Attraction
        
        init(map: MyView1, attraction: Attraction){
            self.map = map
            self.attraction = attraction
        }
        
        // how the annotation is displayed
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: nil)
            
            annotationView.canShowCallout = true
            annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            return annotationView
            
        }
        
        // how to respond
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            
            map.showAttraction = true
            // AttractionView(attraction: attraction)
                
        }
        
        
        
    }
    
}

//struct MapView: View {
//
//
//    var body: some View {
//        MyView1(name: String(), region: MKCoordinateRegion(), attraction: Attraction())
//
//    }
//}
