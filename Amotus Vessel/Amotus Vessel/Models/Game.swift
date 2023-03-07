//
//  Game.swift
//  Amotus Vessel
//
//  Created by Pierpaolo Siciliano on 01/03/23.
//

import SpriteKit

class Game {
    var scene = SKScene(fileNamed: "FinalBossLevel")
    let manager: SceneManager
    let gamePad = GamePad()
    
    init() {
        guard let manager = scene as? SceneManager else {
            fatalError("Downcasting of the .sks custom class failed")
        }
        self.manager = manager
        manager.gamePad = gamePad
        
        guard let player = self.manager.entityManager.entities["player"] as? Player else {
            fatalError("Downcasting of Player failed")
        }
        gamePad.delegate = player
    }
}
