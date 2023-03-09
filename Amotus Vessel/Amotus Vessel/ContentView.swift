//
//  ContentView.swift
//  Gamemotion
//
//  Created by Htet Myat Moe Myint Kyeal on 02/03/23.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    let game = Game()
    var scene: SKScene {
        guard let scene = game.scene else {
            fatalError("File .sks not found")
        }
        scene.scaleMode = .aspectFit
        return scene
    }
    
    var body: some View {
#if DEBUG
        SpriteView(
            scene: scene,
            debugOptions: [.showsFPS, .showsPhysics, .showsNodeCount]
        )
        .frame(minWidth: 756, minHeight: 472.5)
#else
        SpriteView(scene: scene)
            .frame(minWidth: 756, minHeight: 472.5)
#endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
