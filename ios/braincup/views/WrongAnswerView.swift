//
//  MainMenuView.swift
//  braincup
//
//  Created by Simon Schubert on 05.10.19.
//  Copyright © 2019 Simon Schubert. All rights reserved.
//

import SwiftUI
import shared

struct WrongAnswerView: View {
    
    var back: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                Image("searching")
            }
            .navigationBarItems(leading: Button(action: { self.back()}){Image("back").foregroundColor(Color(hex: 0xFFED7354))})
        }.navigationViewStyle(StackNavigationViewStyle()) 
    }
}
