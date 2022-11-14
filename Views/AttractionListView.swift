//
//  Tab1View.swift
//  GCCTourGuide
//
//  Created by Tyler Ridout on 11/12/22.
// Edited by Ethan Brown on 11/13/22

import SwiftUI

struct AttractionView: View {
    var attraction: Attraction
    
    var body: some View {
        VStack(alignment: .leading){
            Text(attraction.name).font(.title)
            Text("This is a non interactive map of where I'm at. Maybe an image of what I look like. Implement me!").padding()
            Text("This is a very interesting and informative fact!")
            Text("I am also known as: \(attraction.shortName)")
            Spacer()
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
                        Text(a.name)
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
