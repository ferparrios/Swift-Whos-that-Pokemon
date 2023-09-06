//
//  PokemonManager.swift
//  who is that pokemon
//
//  Created by Fernando Paredes Rios on 15/08/23.
//

import Foundation

protocol PokemonManagerDelegate {
    func didUpdatePokemon(pokemons: [PokemonModel])
    func didFailWithError(error: Error)
}

struct PokemonManager {
    let pokemonUrl: String = "https://pokeapi.co/api/v2/pokemon?limit=898"
    var delegate: PokemonManagerDelegate?
    func fetchPokemon() {
        performRequest(with: pokemonUrl)
    }

    private func performRequest(with urlString: String){
        //    Create/get url
        if let url = URL(string: urlString) {
            //    Create URL Sesion
            let session = URLSession(configuration: .default)
            //    Give the sesion a taks
            let task = session.dataTask(with: url){data, response, error in
                if error != nil{
//                    print(error!)
                    self.delegate?.didFailWithError(error: error!)
                }
                
                if let safeData = data {
                    if let pokemon = self.parseJSON(pokemonData: safeData){
//                        print(pokemon)
                        self.delegate?.didUpdatePokemon(pokemons: pokemon)
                    }
                }
            }
            task.resume()
        }
        
        
        
        //    Start the task
    }
    
    private func parseJSON(pokemonData: Data) -> [PokemonModel]? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(PokemonData.self, from: pokemonData)
            let pokemon = decodeData.results?.map{
                PokemonModel(name: $0.name ?? "", imageURL: $0.url ?? "")
            }
            return pokemon
        }catch{
            return nil
        }
    }
}
