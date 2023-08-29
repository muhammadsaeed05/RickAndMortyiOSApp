//
//  CharacterGridItem.swift
//  RickAndMortyFandom
//
//  Created by Muhammad Saeed on 27/08/2023.
//

import SwiftUI

struct CharacterGridItem: View {
    
    let character: Character
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: character.image ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
            } placeholder: {
                Rectangle()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.1)
                    .cornerRadius(12)
                    .background {
                        ProgressView()
                    }
                
            }
            
            Text(character.name ?? "")
                .font(.title)
                .scaledToFit()
                .bold()
            
            HStack {
                Text(character.species ?? "")
                    .font(.subheadline)
                
                Spacer()
                
                Text(character.status?.rawValue ?? "")
                    .font(.subheadline)
            }

        }
        .frame(width: 180)
        .frame(maxHeight: 300)
        .padding()
    }
}

struct CharacterGridItem_Previews: PreviewProvider {
    static var previews: some View {
        CharacterGridItem(character: dev.character)
            .previewLayout(.sizeThatFits)
    }
}
