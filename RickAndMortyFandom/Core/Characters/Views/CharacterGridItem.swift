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
        VStack(alignment: .leading, spacing: .zero) {
            AsyncImage(url: URL(string: character.image ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
//                    .frame(height: 180)
                    .clipped()
            } placeholder: {
                Rectangle()
                    .scaledToFill()
                    .foregroundColor(.gray)
                    .opacity(0.1)
//                    .frame(height: 180)
                    .background {
                        ProgressView()
                    }
                
            }
            
            VStack(alignment: .leading, spacing: 8) {
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
                        .foregroundColor(character.status?.color)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 8)
            .padding(.vertical, 12)
        }
        .background(Theme.detailBackground)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    .shadow(color: Theme.text.opacity(0.1),
            radius: 2,
            x: 0,
            y: 1)
    }
        

}

struct CharacterGridItem_Previews: PreviewProvider {
    static var previews: some View {
        CharacterGridItem(character: dev.character)
            .previewLayout(.sizeThatFits)
    }
}
