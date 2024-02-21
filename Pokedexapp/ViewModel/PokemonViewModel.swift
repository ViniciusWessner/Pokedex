//
//  PokemonViewModel.swift
//  Pokedexapp
//
//  Created by Vinicius Wessner on 19/02/24.
//

import Foundation
import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    let baseURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchPokemon()
    }
    
  func fetchPokemon() {
      guard let url = URL(string: baseURL) else {return}
      
      URLSession.shared.dataTask(with: url) { (data, response, error) in
          guard let data = data?.parseData(removingString: "null,") else {return}
          guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else {return}
          
          DispatchQueue.main.async {
              self.pokemon = pokemon
          }
          
      }.resume()
    }
    
    func backgroudColor(fortype type: String) -> UIColor {
        switch type {
        case "fire": return .systemRed
        case "poison": return .systemGreen
        case "water": return .systemBlue
        case "eletric": return .systemYellow
        case "psychic": return .systemPurple
        case "normal": return .systemOrange
        case "ground": return .systemGray
        case "flying": return .systemTeal
        case "fairy": return .systemPink
        
        default:
            return .systemIndigo
        }
    }
}



//funcao praa remover o null que o firebase criou no endpoint
extension Data {
    func parseData(removingString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "" )
        guard let data = parsedDataString?.data(using: .utf8) else {return nil}
        return data
    }
}
