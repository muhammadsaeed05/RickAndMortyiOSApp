//
//  ContentView.swift
//  RickAndMortyFandom
//
//  Created by Muhammad Saeed on 25/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            CharacterView()
                .tabItem {
                    Label("Characters", systemImage: "person.2")
                }
            Text("Locations")
                .tabItem {
                    Label("Locations", systemImage: "location")
                }
            Text("Episodes")
                .tabItem {
                    Label("Episodes", systemImage: "tv")
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
