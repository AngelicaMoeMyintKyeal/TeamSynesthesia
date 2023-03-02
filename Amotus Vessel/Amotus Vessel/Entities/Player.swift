//
//  Player.swift
//  Amotus Vessel
//
//  Created by Pierpaolo Siciliano on 01/03/23.
//

import SpriteKit
import GameplayKit

class Player: GKEntity, InputDelegate {
    var isJumping = false
    
    /// Create a Player from a String corresponding to the file name of the texture
    init(imageName: String) {
        super.init()
        let texture = SKTexture(imageNamed: imageName)
        let sprite = Sprite(texture: texture, scaleFactor: 0.03)
        addComponent(sprite)
        create(basedOn: sprite)
    }
    
    /// Create a Player from a SKNode
    init(node: SKNode) {
        super.init()
        let sprite = Sprite(node: node)
        addComponent(sprite)
        create(basedOn: sprite)
    }
    
    private func create(basedOn sprite: Sprite) {
        let physics = Physics(
            node: sprite.node,
            category: .player,
            contact: .ground,
            collision: .ground
        )
        physics.physics.allowsRotation = false
        addComponent(physics)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func jump() {
        isJumping = true
        if let spriteComponent = self.component(ofType: Sprite.self) {
            spriteComponent.node.run(SKAction.moveTo(y: 70, duration: 1.0)) {
                self.isJumping = false
            }
        }
    }
}
