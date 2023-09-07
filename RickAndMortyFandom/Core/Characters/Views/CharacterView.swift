//
//  CharacterView.swift
//  RickAndMortyFandom
//
//  Created by Muhammad Saeed on 25/08/2023.
//

import SwiftUI

struct CharacterView: View {
    
    @StateObject var viewModel: CharacterViewModel = CharacterViewModel()
    @State private var showAlert = false
    
    let columns: [GridItem] = [
        GridItem(.flexible(),spacing: 5, alignment: nil ),
        GridItem(.flexible(),spacing: 5, alignment: nil )
    ]
    
    
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                Theme.background
                    .ignoresSafeArea(edges: .top)
                
                ScrollView {
                    
                    if viewModel.isLoading {
                        ProgressView()
                    } else {
                        charactersGrid
                            .padding(.horizontal, 6)
                    }
                    
                }
                .overlay(alignment: .bottom, content: {
                    if viewModel.isFetching {
                        ProgressView()
                    }
                })
            }
            .task {
                await viewModel.loadData()
            }
            .onReceive(viewModel.$error, perform: { error in
                if error != nil {
                    showAlert.toggle()
                }
            })
            .refreshable {
                Task {
                    await viewModel.loadData()
                }
            }
            .alert(isPresented: $viewModel.hasError, error: viewModel.error) {
                Button("Retry") {
                    Task {
                        await viewModel.loadData()
                    }
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

private extension CharacterView {
    var charactersGrid: some View {
        LazyVGrid(columns: columns) {
            ForEach(viewModel.allCharacters) { character in
                
                CharacterGridItem(character: character)
                    .onAppear {
                        if viewModel.allCharacters.last?.id == character.id {
                            Task {
                                await viewModel.loadNextSetOfData()
                            }
                        }
                    }
            }
        }
        
        //        .alert("Error", isPresented: $showAlert, actions: {
        //            Button("Ok", role: .cancel) {}
        //        }, message: {
        //            Text(viewModel.error?.localizedDescription ?? "")
        //        })
        
    }
}
