//
//  MapView.swift
//  GCCTourGuide
//
//  Created by Tyler Ridout on 12/7/22.
//
import SwiftUI

import MapKit

struct MyView1 : UIViewRepresentable{
    var name: String
    var region: MKCoordinateRegion
    
    init(name: String, region: MKCoordinateRegion) {
        self.name = name
        self.region = region
    }
    
    
    
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
        return Coordinator(map: self)
    }
    
    
    // delegate
    class Coordinator : NSObject, MKMapViewDelegate{
        
        var map : MyView1
        
        init(map: MyView1){
            self.map = map
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
            
        }
        
        
        
    }
    
}

struct MapView: View {
        
    var body: some View {
        MyView1(name: String(), region: MKCoordinateRegion())

    }
}
