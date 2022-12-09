//
//  Tab2View.swift
//  GCCTourGuide
//
//  Created by Tyler Ridout on 11/12/22.
//  Edited by Eric Sayre on 12/9/22

import SwiftUI

import MapKit

struct MyView : UIViewRepresentable{
    @ObservedObject var VM : ViewModel
    
    init(VM: ViewModel) {
        self.VM = VM
    }
    
    var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.154817, longitude: -80.081528), span: MKCoordinateSpan(latitudeDelta: 0.008, longitudeDelta: 0.008))
    
    
    var point_of_interest: [MKPointAnnotation] {
        
        var locs = [MKPointAnnotation]()
        var loc = MKPointAnnotation()
        loc.coordinate = CLLocationCoordinate2D(latitude: region.center.latitude, longitude: region.center.longitude)
        loc.title = "Grove City College"
        
        locs.append(loc)
        
        var loc2 = MKPointAnnotation()
        loc2.coordinate = CLLocationCoordinate2D(latitude: 41.15464529518545, longitude: -80.07741582944116)
        loc2.title = "Staley Hall of Arts and Letters"
        locs.append(loc2)
        
        var loc3 = MKPointAnnotation()
        loc3.coordinate = CLLocationCoordinate2D(latitude: 41.1555742732833, longitude: -80.07884276456556)
        loc3.title = "STEM"
        locs.append(loc3)
        
        var loc4 = MKPointAnnotation()
        loc4.coordinate = CLLocationCoordinate2D(latitude: 41.15585700313474, longitude: -80.07839215347364)
        loc4.title = "Physical Learning Center"
        locs.append(loc4)
        
        var loc5 = MKPointAnnotation()
        loc5.coordinate = CLLocationCoordinate2D(latitude: 41.15286101443959, longitude: -80.07710335208415)
        loc5.title = "Pew Fine Arts Center"
        locs.append(loc5)
        
        var loc6 = MKPointAnnotation()
        loc6.coordinate = CLLocationCoordinate2D(latitude: 41.15571769943206, longitude: -80.08138814924192)
        loc6.title = "Crawford Hall"
        locs.append(loc6)
        
        var loc7 = MKPointAnnotation()
        loc7.coordinate = CLLocationCoordinate2D(latitude: 41.156799857174725, longitude: -80.08076365267512)
        loc7.title = "Harbison Chapel"
        locs.append(loc7)
        
        var loc8 = MKPointAnnotation()
        loc8.coordinate = CLLocationCoordinate2D(latitude: 41.1546733415365, longitude: -80.078949108177)
        loc8.title = "Hoyt Hall of Engineering"
        locs.append(loc8)
        
        var loc9 = MKPointAnnotation()
        loc9.coordinate = CLLocationCoordinate2D(latitude: 41.15406495256201, longitude: -80.07943859769291)
        loc9.title = "Henry Buhl Library"
        locs.append(loc9)
        
        var locA = MKPointAnnotation()
        locA.coordinate = CLLocationCoordinate2D(latitude: 41.15695082575129, longitude: -80.08005550582777)
        locA.title = "MAP Café"
        locs.append(locA)
        
        var locB = MKPointAnnotation()
        locB.coordinate = CLLocationCoordinate2D(latitude: 41.153300548531746, longitude: -80.07873854127108)
        locB.title = "Hicks Café"
        locs.append(locB)
        
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
        return Coordinator(map: self, VM: ViewModel())
    }
    
    
    // delegate
    class Coordinator : NSObject, MKMapViewDelegate{
        
        var map : MyView
        @ObservedObject var VM : ViewModel
        
        init(map: MyView, VM: ViewModel){
            self.map = map
            self.VM = VM
        }
        
        // how the annotation is displayed
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: nil)
            
            annotationView.canShowCallout = true
            annotationView.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            return annotationView
            
        }
        
        // how to respond
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) -> some View{
            
            if view.annotation?.title == "Grove City College"{
                print("Grove City College ")
            }
            var ret : Attraction = VM.attractions[0]
            for a in VM.attractions{
                if a.name == view.annotation?.title{
                    ret = a
                }
            }
            
            return AttractionView(attraction: ret)
        }
        
        
        
    }
    
}
//struct Tab2View: View {
//
//    var body: some View {
//        MyView(attraction: Attraction())
//
//    }
//}
