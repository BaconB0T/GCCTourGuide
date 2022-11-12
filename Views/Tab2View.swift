//
//  Tab2View.swift
//  GCCTourGuide
//
//  Created by Tyler Ridout on 11/12/22.
//

import SwiftUI

struct Tab2View: View {
    @ObservedObject var VM : ViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Tab2View_Previews: PreviewProvider {
    static var previews: some View {
        Tab2View(VM: ViewModel())
    }
}
