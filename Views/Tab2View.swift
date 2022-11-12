//
//  Tab2View.swift
//  GCCTourGuide
//
//  Created by Tyler Ridout on 11/12/22.
//

import SwiftUI

import MapKit

struct MyView : UIViewRepresentable{
    @ObservedObject var VM : ViewModel

    
    var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.154817, longitude: -80.081528), span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003))
    
    
    var point_of_interest: [MKPointAnnotation] {
        
        var locs = [MKPointAnnotation]()
        var loc = MKPointAnnotation()
        loc.coordinate = CLLocationCoordinate2D(latitude: region.center.latitude, longitude: region.center.longitude)
        loc.title = "Grove City College"
        
        locs.append(loc)
        
        var loc2 = MKPointAnnotation()
        loc2.coordinate = CLLocationCoordinate2D(latitude: region.center.latitude+0.01, longitude: region.center.longitude-0.005)
        loc2.title = "SwiftUI"
        locs.append(loc2)
        
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
        
        var map : MyView
        
        init(map: MyView){
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
            
            if view.annotation?.title == "Grove City College"{
                print("Grove City College ")
            }else if view.annotation?.title == "SwiftUI"{
                print("SwiftUI")
            }
            
        }
        
        
        
    }
    
}
struct Tab2View: View {
        
    var body: some View {
        MyView(VM: ViewModel())

    }
}
