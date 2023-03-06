//
//  SceneManager.swift
//  Amotus Vessel
//
//  Created by Htet Myat Moe Myint Kyeal on 02/03/23.
//

import SpriteKit

class SceneManager: SKScene, SKPhysicsContactDelegate {
    var entityManager: EntityManager!
    var gamePad: GamePad?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.entityManager = EntityManager(scene: super.scene!)
    }
    
    override func update(_ currentTime: TimeInterval) {
        guard let gamePad = self.gamePad else { return }
        pollInput(from: gamePad)
    }
    
    func pollInput(from gamePad: GamePad) {
        if let direction = gamePad.movementDirection?.xAxis.value {
            guard let player = entityManager.entities["player"] else { return }
            if direction > 0 {
                print("moving right")
            } else if direction < 0 {
                print("moving left")
            }
            player.component(ofType: Sprite.self)?.node.position.x += Double(direction) * 4
        }
    }
}
