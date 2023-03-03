//
//  OnboardingParticleScene.swift
//  Amotus Vessel
//
//  Created by Htet Myat Moe Myint Kyeal on 03/03/23.
//

import SpriteKit

class OnboardingParticleScene: SKScene {
    
    let sparkEmitterNode = SKEmitterNode(fileNamed: "OnboardingParticle.sks")

        override func didMove(to view: SKView) {
            guard let sparkEmitterNode = sparkEmitterNode else { return }
            sparkEmitterNode.particleSize = CGSize(width: 30, height: 30)
            sparkEmitterNode.particleLifetime = 8
            sparkEmitterNode.particleLifetimeRange = 10
            addChild(sparkEmitterNode)
        }

        override func didChangeSize(_ oldSize: CGSize) {
            guard let sparkEmitterNode = sparkEmitterNode else { return }
            sparkEmitterNode.particlePosition = CGPoint(x: size.width/2, y: size.height)
            sparkEmitterNode.particlePositionRange = CGVector(dx: size.width, dy: size.height)
        }
    
}
