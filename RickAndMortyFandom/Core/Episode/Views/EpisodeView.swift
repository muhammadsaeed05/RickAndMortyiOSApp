//
//  EpisodeView.swift
//  RickAndMortyFandom
//
//  Created by Muhammad Saeed on 25/08/2023.
//

import SwiftUI

struct EpisodeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Episodes")
            }
            .navigationTitle("Episodes")
        }

    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView()
    }
}
