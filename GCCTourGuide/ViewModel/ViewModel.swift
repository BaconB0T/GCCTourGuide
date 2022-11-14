//
//  View Model.swift
//  GCCTourGuide
//
//  Created by Tyler Ridout on 11/12/22.
//  Edited by Ethan Brown on 11/13/22

import Foundation

class ViewModel : ObservableObject{
    var attractions = [Attraction]()
    
    init() {
        print("init ViewModel")
        readJSONFile()
    }
    
    func readJSONFile() {
        if let pathString = Bundle.main.path(forResource: "attractions", ofType: "json") {
            let url = URL(fileURLWithPath: pathString)
            do {
                let data = try Data(contentsOf: url)
                let jsonDecoder = JSONDecoder()
                var jsonData = try jsonDecoder.decode(AllAttractions.self, from: data)
                for i in 0..<jsonData.attractions.count {
                    jsonData.attractions[i].id = UUID()
                }
                attractions = jsonData.attractions
                print("attractions done!")
                print(attractions)
            } catch {
                print("Error: \(error)")
            }
        } else {
            print("Failed! No file found :(")
        }
        
    }
}
