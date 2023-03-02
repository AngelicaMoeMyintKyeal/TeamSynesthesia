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
    
    // TODO: Fix the full screen error
    
    var body: some View {
        if let scene = game.scene {
            SpriteView(
                scene: scene,
                debugOptions: [.showsFPS, .showsPhysics, .showsNodeCount]
            )
            .frame(width: 1200, height: 600)
        } else {
            fatalError("File .sks not found")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
