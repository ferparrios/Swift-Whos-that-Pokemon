//
//  PokemonData.swift
//  who is that pokemon
//
//  Created by Fernando Paredes Rios on 15/08/23.
//

import Foundation

struct PokemonData: Codable {
    let results: [Result]?
}

struct Result: Codable {
    let name: String
    let url: String
}
