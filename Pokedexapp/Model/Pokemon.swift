//
//  Pokemon.swift
//  Pokedexapp
//
//  Created by Vinicius Wessner on 19/02/24.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
}

let MOCK_POKEMON: [Pokemon] = [
    .init(id: 1, name: "Bubasauro", imageUrl: "bobasaur", type: "poison"),
    .init(id: 2, name: "Ivysaur", imageUrl: "bobasaur", type: "poison"),
    .init(id: 3, name: "Venasaur", imageUrl: "bobasaur", type: "fire"),
    .init(id: 4, name: "Charmendar", imageUrl: "bobasaur", type: "fire"),
]
