//
//  Sprite.swift
//  Amotus Vessel
//
//  Created by Pierpaolo Siciliano on 01/03/23.
//

import SpriteKit
import GameplayKit

class Sprite: GKComponent {
    let node: SKSpriteNode
    
    init(texture: SKTexture, scaleFactor: Double = 1.0) {
        node = SKSpriteNode(texture: texture)
        if scaleFactor != 1.0 {
            node.setScale(CGFloat(scaleFactor))
        }
        super.init()
    }
    
    init(node: SKNode) {
        self.node = node as! SKSpriteNode
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
