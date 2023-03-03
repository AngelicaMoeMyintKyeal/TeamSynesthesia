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
        SpriteView(
            scene: scene,
            debugOptions: [.showsFPS, .showsPhysics, .showsNodeCount]
        )
        .frame(minWidth: 1200, minHeight: 600)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
