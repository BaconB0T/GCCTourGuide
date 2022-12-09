//
//  ContentView.swift
//  GCCTourGuide
//
//  Created by Ethan Brown on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var tabIndex = 1
    @State var showAttraction: Bool = false
    @State var shownAttractionIndex: Int = 0
    @ObservedObject var VM = ViewModel()
    
    var body: some View {
        VStack {
            TabView(selection: $tabIndex){
                AttractionListView(VM: VM).tabItem{
                    Image(systemName: "list.bullet.rectangle.portrait")
                    Text("Attraction List")
                }.tag(1)
                
                MyView(VM: VM, showAttraction: $showAttraction, shownAttractionIndex: $shownAttractionIndex).tabItem{
                    Image(systemName: "map")
                    Text("Attraction Map")
                }.tag(2).sheet(isPresented: $showAttraction) {
                    AttractionView(attraction: VM.attractions[shownAttractionIndex])
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
