//
// ImageManager.swift
//  who is that pokemon
//
//  Created by Fernando Paredes Rios on 15/08/23.
//

import Foundation

protocol ImageManagerDelegate {
    func didUpdateImage(image: ImageModel)
    func didFailWithErrorImage(error: Error)
}

struct ImageManager {
    
    var delegate: ImageManagerDelegate?
    func fetchImage(url: String) {
        performRequest(with: url)
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
                    self.delegate?.didFailWithErrorImage(error: error!)
                }
                
                if let safeData = data {
                    if let image = self.parseJSON(imageData: safeData){
//                        print(pokemon)
                        self.delegate?.didUpdateImage(image: image)
                    }
                }
            }
            task.resume()
        }
        
        
        
        //    Start the task
    }
    
    private func parseJSON(imageData: Data) -> ImageModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(ImageData.self, from: imageData)
            let image = decodeData.sprites.other?.officialArtwork.frontDefault ?? ""
            return ImageModel(imageURL: image)
        }catch{
            return nil
        }
    }
}
