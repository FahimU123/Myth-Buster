//
//  Home.swift
//  Myth Buster
//
//  Created by Fahim Uddin on 2/26/25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            CoreBeliefsList()
                .tabItem {
                    Image(systemName: "house")
                    Text("Core Beliefs")
                }
            
            MisconceptionsView()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("Misconceptions")
                }
            
            Practices()
                .tabItem {
                    Image(systemName: "sunrise.fill")
                    Text("Practices")
                    
                }
            
            HistoryAndCulture()
                .tabItem {
                    Image(systemName: "book")
                    Text("History & Culture")
                }
        }
    }
}

#Preview {
    Home()
}
