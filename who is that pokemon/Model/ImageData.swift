// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pokemonData = try? JSONDecoder().decode(PokemonData.self, from: jsonData)

import Foundation

// MARK: - PokemonData
struct ImageData: Codable {
    let sprites: Sprites
}



// MARK: - Sprites
class Sprites: Codable {
    let other: Other?
   
    init(other: Other?) {
        self.other = other
    }
}

// MARK: - Other
struct Other: Codable {
    let officialArtwork: OfficialArtwork
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}


// MARK: - OfficialArtwork
struct OfficialArtwork: Codable {
    let frontDefault, frontShiny: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}







