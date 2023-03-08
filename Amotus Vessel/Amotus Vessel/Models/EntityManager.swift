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
        
        // create an area that confines the other nodes
        if let arena = scene.childNode(withName: "background") {
            arena.physicsBody = SKPhysicsBody(edgeLoopFrom: arena.frame)
        }
        
        // get the player from the scene and adds it to the entities
        if let player = scene.childNode(withName: "player") {
            add(name: player.name!, entity: Player(node: player))
        }
        
        // get the platforms from the scene and add them to the entities
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
    }
}
