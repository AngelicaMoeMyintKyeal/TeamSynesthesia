//
//  EntityManager.swift
//  Amotus Vessel
//
//  Created by Pierpaolo Siciliano on 01/03/23.
//

import GameplayKit
import SpriteKit

class EntityManager {
    var entities: [String: GKEntity] = [:]
    let scene: SKScene
    
    init(scene: SKScene) {
        self.scene = scene
        
        // check for player and add the entities
        if let player = scene.childNode(withName: "player") {
            add(name: player.name!, entity: Player(node: player))
        }
        
        // check for platforms and add to the entities
        var index = 0
        while index >= 0 {
            if let platform = scene.childNode(withName: "platform\(index)") {
                add(name: platform.name!, entity: Platform(node: platform))
                index += 1
            } else {
                index = -1
            }
        }
    }
    
    func add(name: String, entity: GKEntity) {
        entities[name] = entity
        
//        if let spriteNode = entity.component(ofType: Sprite.self)?.node {
//            scene.addChild(spriteNode)
//        }
    }
    
//    func searchNode(_ nodeName: String) -> SKNode? {
//        if let node = scene.childNode(withName: nodeName) as? SKSpriteNode {
//            switch nodeName {
//            case "player":
//                let texture = node.texture!
//                add(name: nodeName, entity: Player(texture: texture))
//            case "platform":
//                let texture = node.texture!
//                add(name: nodeName, entity: Platform(texture: texture))
//            default:
//                // TODO: something here
//            }
//            return node
//        } else {
//            // TODO: Throw an error here since the sprite node was not found
//        }
//    }
}
