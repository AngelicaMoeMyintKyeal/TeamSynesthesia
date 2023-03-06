//
//  MenuView.swift
//  Amotus Vessel
//
//  Created by Htet Myat Moe Myint Kyeal on 02/03/23.
//

import SwiftUI
import SpriteKit
import AppKit

struct MenuView: View {
    
    let newGame: LocalizedStringKey = "New Game"
    let quitGame: LocalizedStringKey = "Quit"
   
    @State private var isHoveringNewGame = false
    @State private var isHoveringQuit = false
    let MenuBlue = Color("MenuBlue")

    var scene: SKScene {
            let scene = OnboardingParticleScene()
            scene.scaleMode = .resizeFill
            scene.backgroundColor = .clear
            return scene
        }
    
    var body: some View {
    
        ZStack {
            
            GeometryReader { geometry in
                
                SpriteView(scene: scene, options: [.allowsTransparency])
                    .ignoresSafeArea(.all)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                
                VStack {
                    
                    Spacer()
                    Text("Amotus Vessel")
                        .font(.custom("IMMORTAL", size: 200))
                        .shadow(color: .white, radius: 20)

                              
                    Spacer()
                    
                    Button(
                        action: {
                            // write action
                            print("Play Button is Clicked")
                        },
                        label: {
                                Text(newGame)
                                .font(.custom("SigismundoDiFanti", size: 30))
                                .foregroundColor(isHoveringNewGame ? Color("MenuBlue") : Color.white)
                        }
                        
                    ) .buttonStyle(BorderlessButtonStyle())
                        .padding(.horizontal, 20)
                        .onHover { hovering in
                            withAnimation(.easeInOut(duration: 0.2)) {
                                isHoveringNewGame = hovering
                            }
                        }
                    Spacer()
                        
                    Button(
                        action: {
                            // write action
                            print("Quit Button is Clicked")
                        },
                        label: {
                                Text(quitGame)
                                .font(.custom("SigismundoDiFanti", size: 30))
                                .foregroundColor(isHoveringQuit ? Color("MenuBlue") : Color.white)
                        }
                        
                    ) .buttonStyle(BorderlessButtonStyle())
                        .padding(.horizontal, 20)
                        .onHover { hovering in
                            withAnimation(.easeInOut(duration: 0.2)) {
                                isHoveringQuit = hovering
                            }
                        }
                    Spacer()

                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                    }
            .background(
                Image("MenuBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
        )
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
