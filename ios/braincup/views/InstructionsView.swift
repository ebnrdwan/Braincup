//
//  InstructionsView.swift
//  braincup
//
//  Created by Simon Schubert on 05.10.19.
//  Copyright © 2019 Simon Schubert. All rights reserved.
//

import SwiftUI
import shared

struct InstructionsView: View {
    var title: String
    var description: String
    var start: () -> Void
    var back: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                Text(description).font(.body).padding(.horizontal, 16).padding(.top, 8).multilineTextAlignment(.center)
                Button(action: {self.start()}) {
                    Text("Start")
                }.buttonStyle(BackgroundButtonStyle()).padding(.top, 16)
            }
            .navigationBarItems(leading: Button(action: { self.back()}){Image("back").foregroundColor(Color(hex: 0xFFED7354))})
            .navigationBarTitle(title)
        }.navigationViewStyle(StackNavigationViewStyle()) 
    }
}
