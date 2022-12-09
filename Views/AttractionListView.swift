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
        GeometryReader { g in
            ScrollView {
                VStack(alignment: .leading){
                    // maybe an image here if we can
                    Text(attraction.name).font(.title)
                    if attraction.image != nil {
                        Image(attraction.image!).resizable()
                            .ignoresSafeArea()
                            .shadow(radius: 20)
                            .padding(.top, 5)
                            .padding(.bottom, 5)
                            .frame(width: g.size.width*0.9, height: g.size.height/4, alignment: .center)
                    }
        //            Text("This is a non interactive map of where I'm at. Maybe an image of what I look like. Implement me!").padding()
                    Text("I am also known as: \(attraction.shortName)")
                    
                    Divider()
                    Text("History 🏺").font(.title2)
                    Text(attraction.history)
                    
                    // Fun Facts
                    if attraction.funFacts != nil {
                        Divider()
                        Text("Fun Facts 🌟").font(.title2)
                        ForEach(attraction.funFacts!, id: \.self) { ff in
                            Text("- \(ff)")
                        }
                        
                    }
                    NavigationLink{
                        MyView1(name: attraction.name, region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: attraction.location.lat, longitude: attraction.location.long), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)))
                    }label:{
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.white)
                                    .frame(height: 50)
                                    .shadow(radius: 20)
                                    .padding(.all, 20)
                                
                                ZStack{
                                    Spacer()
                                    VStack{
                                        Text("View on map").foregroundColor(.black)
                                    }
                                }
                            }
                        }
                    }
                }.fixedSize(horizontal: false, vertical: true)
            }
        }.padding()
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
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.white)
                                    .frame(height: 80)
                                    .shadow(radius: 20)
                                   // .padding(.all, 1)
                                
                                ZStack{
                                    VStack{
                                        Text(a.name).foregroundColor(.black)
                                            .font(.title2)
                                    }
                                }
                            }
                        }
                        
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
