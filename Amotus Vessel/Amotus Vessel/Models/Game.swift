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
        if let manager = scene as? SceneManager {
            self.manager = manager
            if let player = self.manager.entityManager.entities["player"] as? Player {
                gamePad.delegate = player
            } else {
                fatalError("Downcasting of Player failed")
            }
        } else {
            fatalError("Downcasting of the .sks custom class failed")
        }
    }
}
