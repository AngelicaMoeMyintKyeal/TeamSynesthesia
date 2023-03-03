//
//  SceneManager.swift
//  Amotus Vessel
//
//  Created by Htet Myat Moe Myint Kyeal on 02/03/23.
//

import SpriteKit

class SceneManager: SKScene, SKPhysicsContactDelegate {
    var entityManager: EntityManager!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.entityManager = EntityManager(scene: super.scene!)
    }
}
