//
//  PodedexView.swift
//  Pokedexapp
//
//  Created by Vinicius Wessner on 19/02/24.
//

import SwiftUI

struct PodedexView: View {
    
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 20 ) {
                    ForEach(viewModel.pokemon) { pokemon in
                        PokemonCell(pokemon: pokemon, viewModel: viewModel)
                    }
                }
            }
            .navigationTitle("Pokemon")
        }
        
    }
}

#Preview {
    PodedexView()
}
