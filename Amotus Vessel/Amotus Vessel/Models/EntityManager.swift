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
        
        // get the player
        if let player = scene.childNode(withName: "player") {
            add(name: player.name!, entity: Player(node: player))
        }
        
        // get the platforms
        for nodeIndex in 0... {
            if let platform = scene.childNode(withName: "platform\(nodeIndex)") {
                add(name: platform.name!, entity: Platform(node: platform))
            } else {
                break
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
