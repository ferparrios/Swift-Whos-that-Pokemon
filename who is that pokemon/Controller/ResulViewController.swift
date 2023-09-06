//
//  ResulViewController.swift
//  who is that pokemon
//
//  Created by Fernando Paredes Rios on 6/09/23.
//

import UIKit
import Kingfisher

class ResulViewController: UIViewController {

    @IBOutlet weak var pokemonLabel: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var pokemonName: String = " "
    var pokemonImageUrl: String = " "
    var finalScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "Perdiste, tu puntaje fue de \(finalScore)"
        pokemonLabel.text = "No, es \(pokemonName)"
        pokemonImage.kf.setImage(with: URL(string: pokemonImageUrl))
    }
    
    @IBAction func playAgainPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
