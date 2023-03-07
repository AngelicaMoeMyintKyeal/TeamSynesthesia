//
//  GameOverView.swift
//  Amotus Vessel
//
//  Created by Htet Myat Moe Myint Kyeal on 06/03/23.
//

import SwiftUI

struct GameOverView: View {
    
    let tryAgain: LocalizedStringKey = "Try Again"
    let mainMenu: LocalizedStringKey = "Main Menu"
    let quitGame: LocalizedStringKey = "Quit"
    
    @State private var isHoveringTryAgain = false
    @State private var isHoveringMainMenu = false
    @State private var isHoveringQuit = false
    let MenuBlue = Color("MenuBlue")
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                        .frame(height: 560)
                    VStack {
                        Button(
                            action: {
                                // write action
                                print("Try Again Button is Clicked")
                            },
                            label: {
                                    Text(tryAgain)
                                    .font(.custom(ParameterConstants.sigismundoFont, size: 30))
                                    .foregroundColor(isHoveringTryAgain ? Color("MenuBlue") : Color.white)
                            }
                        ) .buttonStyle(BorderlessButtonStyle())
                            .padding(.horizontal, 20)
                            .onHover { hovering in
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    isHoveringTryAgain = hovering
                                }
                            }
                        Spacer()
                            .frame(height: 80)
                        Button(
                            action: {
                                // write action
                                print("Main Menu Button is Clicked")
                            },
                            label: {
                                    Text(mainMenu)
                                    .font(.custom(ParameterConstants.sigismundoFont, size: 30))
                                    .foregroundColor(isHoveringMainMenu ? Color("MenuBlue") : Color.white)
                            }
                        ) .buttonStyle(BorderlessButtonStyle())
                            .padding(.horizontal, 20)
                            .onHover { hovering in
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    isHoveringMainMenu = hovering
                                }
                            }
                        Spacer()
                            .frame(height: 80)
                        Button(
                            action: {
                                NSApplication.shared.terminate(nil)
                                print("Quit Game Button is Clicked")
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
                    }
                    Spacer()
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
        .background(
            Image("GameOverBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
            )
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView()
    }
}
