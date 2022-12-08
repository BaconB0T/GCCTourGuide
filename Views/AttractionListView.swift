//
//  Tab1View.swift
//  GCCTourGuide
//
//  Created by Tyler Ridout on 11/12/22.
// Edited by Ethan Brown on 11/13/22

import SwiftUI
import MapKit
struct AttractionView: View {
    var attraction: Attraction
    
    var body: some View {
        VStack(alignment: .leading){
            // maybe an image here if we can
            Text(attraction.name).font(.title)
            Text("This is a non interactive map of where I'm at. Maybe an image of what I look like. Implement me!").padding()
            Text("I am also known as: \(attraction.shortName)")
            
            Divider()
            Text("History").font(.title2)
            Text(attraction.history)
            
            // Fun Facts
            if attraction.funFacts != nil {
                Divider()
                Text("Fun Facts").font(.title2)
                ForEach(attraction.funFacts!, id: \.self) { ff in
                    Text("- \(ff)")
                }
                
            }
            NavigationLink{
                MyView1(name: attraction.name, region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: attraction.location.lat, longitude: attraction.location.long), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)))
            }label:{
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white)
                            .frame(height: 50)
                            .shadow(radius: 10)
                            .padding(.all, 10)
                        
                        ZStack{
                            Spacer()
                            VStack{
                                Text("View on map").foregroundColor(.black)
                            }
                        }
                    }
                }
            }
        }
    }
}
                struct AttractionListView: View {
                    
                    // why not EnvironmentObject?
                    @ObservedObject var VM : ViewModel
                    var body: some View {
                        NavigationView{
                            ScrollView{
                                ForEach(VM.attractions) { a in
                                    NavigationLink {
                                        AttractionView(attraction: a)
                                    } label: {
                                        Text(a.name).foregroundColor(.black)
                                    }.padding()
                                }
                            }.navigationTitle("Attractions")
                        }
                    }
                }
                
                struct AttractionListView_Previews: PreviewProvider {
                    static var previews: some View {
                        AttractionListView(VM: ViewModel())//.environmentObject(ViewModel())
                    }
                }
