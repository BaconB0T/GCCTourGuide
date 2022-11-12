//
//  ContentView.swift
//  GCCTourGuide
//
//  Created by Ethan Brown on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var tabIndex = 1

    @ObservedObject var VM = ViewModel()
    
    var body: some View {
        VStack {
            TabView(selection: $tabIndex){
                Tab1View(VM: VM).tabItem{
                    Image(systemName: "list.bullet.rectangle.portrait")
                    Text("Attraction List")
                }.tag(1)
                
                MyView(VM: VM).tabItem{
                    Image(systemName: "map")
                    Text("Attraction Map")
                }.tag(2)
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
