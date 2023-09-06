//
//  GameModel.swift
//  who is that pokemon
//
//  Created by Fernando Paredes Rios on 15/08/23.
//

import Foundation

struct GameModel{
    var score = 0
    
//    Revisar si la respuesta es correcta
    mutating func checkAnswer(_ userAnswer: String, _ correctAnswer: String) -> Bool {
        if userAnswer.lowercased() == correctAnswer.lowercased(){
            score += 1
            return true
        }
        return false
        
    }
    
//    Obtener el score
    func getScore() -> Int {
        return score
    }
    
//    Reiniciar el score
    mutating func setScore(score: Int) {
        self.score = score
    }
}
