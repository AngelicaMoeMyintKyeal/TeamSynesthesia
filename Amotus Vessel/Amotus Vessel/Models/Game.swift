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
                print("Downcasting of Player done")
            } else {
                print("Downcasting of Player failed")
            }
            print(self.manager.test)
//            print(self.manager.entityManager)
        } else {
            fatalError("Downcasting of the .sks custom class failed")
        }
    }
}
