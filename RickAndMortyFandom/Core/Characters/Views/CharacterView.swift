//
//  CharacterView.swift
//  RickAndMortyFandom
//
//  Created by Muhammad Saeed on 25/08/2023.
//

import SwiftUI

struct CharacterView: View {
    
    @StateObject var viewModel = CharacterViewModel()
    @State private var showAlert = false
    
    let columns: [GridItem] = [
        GridItem(.flexible(),spacing: 5, alignment: nil ),
        GridItem(.flexible(),spacing: 5, alignment: nil )
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.allCharacters) { character in
                        
                        CharacterGridItem(character: character)
                            .onAppear {
                                if viewModel.allCharacters.last?.id == character.id {
                                    Task {
                                       await viewModel.loadData()
                                    }
                                }
                            }
                    }
                }
                .onReceive(viewModel.$error, perform: { error in
                    if error != nil {
                        showAlert.toggle()
                    }
                })
                .alert("Error", isPresented: $showAlert, actions: {
                    Button("Ok", role: .cancel) {}
                }, message: {
                    Text(viewModel.error?.localizedDescription ?? "")
                })
            
            }
            .refreshable {
                Task {
                    await viewModel.reloadData()
                }
            }
            .navigationTitle("Characters")
        }
        
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
