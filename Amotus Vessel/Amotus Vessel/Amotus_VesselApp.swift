//
//  GamemotionApp.swift
//  Gamemotion
//
//  Created by Htet Myat Moe Myint Kyeal on 02/03/23.
//

import SwiftUI

@main
struct GamemotionApp: App {
    @StateObject var currentView = ViewHandler()
    var body: some Scene {
        WindowGroup {
            switch currentView.viewState {
            case .intro:
                IntroVideoView(viewState: currentView, deviceLang: Locale.current.languageCode ?? ParameterConstants.englishLanguage)
            case .menu:
                MenuView(currentView: currentView)
            case .game:
                ContentView()
            case .gameOver:
                GameOverView()
            }
        }
    }
}

class ViewHandler: ObservableObject {
    @Published var viewState: CurrentView = .intro
    enum CurrentView {
        case intro
        case menu
        case game
        case gameOver
    }
}
