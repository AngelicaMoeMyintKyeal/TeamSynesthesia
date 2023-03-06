//
//  Physics.swift
//  Amotus Vessel
//
//  Created by Pierpaolo Siciliano on 01/03/23.
//

import SpriteKit
import GameplayKit

class Physics: GKComponent {
    let physics: SKPhysicsBody
    
    enum bitMasks: UInt32 {
        case player = 0b1
        case ground = 0b10
    }

    init(node: SKSpriteNode, category: bitMasks, contact: bitMasks, collision: bitMasks) {
        switch node.name {
        case "player":
            physics = SKPhysicsBody(rectangleOf: CGSize(width: 60, height: 160))
        case "platform0",
            "platform1",
            "platform2",
            "platform3",
            "platform4",
            "platform5":
            physics = SKPhysicsBody(rectangleOf: CGSize(width: 140, height: 65))
        default:
            if let texture = node.texture {
                physics = SKPhysicsBody(texture: texture, size: node.size)
                //            print(node.size)
            } else {
                physics = SKPhysicsBody()
            }
        }
        physics.categoryBitMask = category.rawValue
        physics.contactTestBitMask = contact.rawValue
        physics.collisionBitMask = collision.rawValue
        node.physicsBody = physics
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
