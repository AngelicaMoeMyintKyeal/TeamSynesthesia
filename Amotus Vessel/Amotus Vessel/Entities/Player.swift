//
//  Player.swift
//  Amotus Vessel
//
//  Created by Pierpaolo Siciliano on 01/03/23.
//

import SpriteKit
import GameplayKit

class Player: GKEntity, InputDelegate {
    var isAttacking = false
    var isMoving = false
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
        guard let spriteComponent = self.component(ofType: Sprite.self) else { return }
        spriteComponent.node.run(SKAction.moveBy(x: 0, y: 150, duration: 0.1)) {
            self.isJumping = false
        }
    }
    
    func attack() {
        isAttacking = true
        // TODO: Add attack code block
        isAttacking = false
    }
    
    func move(direction: direction) {
        isMoving = true
        guard let spriteComponent = self.component(ofType: Sprite.self) else { return }
        var movement: CGFloat = 30
        if direction == .left { movement *= -1 }
        spriteComponent.node.run(SKAction.moveBy(x: movement, y: 0, duration: 0.1)) {
            self.isMoving = false
        }
    }
}
