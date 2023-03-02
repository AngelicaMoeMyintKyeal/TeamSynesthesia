//
//  Platform.swift
//  Amotus Vessel
//
//  Created by Pierpaolo Siciliano on 01/03/23.
//

import SpriteKit
import GameplayKit

class Platform: GKEntity {
    /// Create a Platform from a String corresponding to the file name of the texture
    init(imageName: String) {
        super.init()
        let texture = SKTexture(imageNamed: imageName)
        let sprite = Sprite(texture: texture, scaleFactor: 0.2)
        addComponent(sprite)
        create(basedOn: sprite)
    }
    
    /// Create a Platform from a SKNode
    init(node: SKNode) {
        super.init()
        let sprite = Sprite(node: node)
        addComponent(sprite)
        create(basedOn: sprite)
    }
    
    private func create(basedOn sprite: Sprite) {
        let physics = Physics(
            node: sprite.node,
            category: .ground,
            contact: .player,
            collision: .player
        )
        physics.physics.affectedByGravity = false
        physics.physics.isDynamic = false
        addComponent(physics)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
