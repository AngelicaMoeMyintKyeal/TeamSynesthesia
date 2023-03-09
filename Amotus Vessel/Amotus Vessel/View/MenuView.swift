//
//  MenuView.swift
//  Amotus Vessel
//
//  Created by Htet Myat Moe Myint Kyeal on 02/03/23.
//

import SwiftUI
import SpriteKit

struct MenuView: View {
    let newGame: LocalizedStringKey = "New Game"
    let quitGame: LocalizedStringKey = "Quit"
    let MenuBlue = Color("MenuBlue")
    
    @ObservedObject var currentView: ViewHandler
    @State private var isHoveringNewGame = false
    @State private var isHoveringQuit = false
    
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
                        .font(.custom(ParameterConstants.immortalFont, size: 200))
                        .shadow(color: .white, radius: 20)
                    Spacer()
                    Button(
                        action: {
                            // FIXME: it works but it requires 2 clicks
                            self.currentView.viewState = .game
                            print("Play Button is Clicked")
                        },
                        label: {
                            Text(newGame)
                                .font(.custom(ParameterConstants.sigismundoFont, size: 30))
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
                        .frame(height: 50)
                    Button(
                        action: {
                            NSApplication.shared.terminate(nil)
                        },
                        label: {
                            Text(quitGame)
                                .font(.custom(ParameterConstants.sigismundoFont, size: 30))
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
        MenuView(currentView: ViewHandler())
    }
}
