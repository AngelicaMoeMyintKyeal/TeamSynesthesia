//
//  IntroVideoView.swift
//  Amotus Vessel
//
//  Created by Htet Myat Moe Myint Kyeal on 02/03/23.
//

import AVKit
import SwiftUI

struct IntroVideoView: View {
    @StateObject var videoPlayerManager = VideoPlayerManager()
    
    var deviceLang: String
    
    var body: some View {
        ZStack {
            //                AVPlayerControllerRepresented(videoPlayer: videoPlayer)
            switch deviceLang {
            case ParameterConstants.englishLanguage: AVPlayerControllerRepresented(videoPlayer:         videoPlayerManager.videoPlayerEng)
            case ParameterConstants.italianLanguage:
                AVPlayerControllerRepresented(videoPlayer: videoPlayerManager.videoPlayerIta)
            case ParameterConstants.koreanLanguage:
                AVPlayerControllerRepresented(videoPlayer: videoPlayerManager.videoPlayerKorean)
            default:
                AVPlayerControllerRepresented(videoPlayer: videoPlayerManager.videoPlayerEng)
            }
            SkipButtonView()
        }
        .onAppear() {
            switch deviceLang {
            case ParameterConstants.englishLanguage:
                videoPlayerManager.playEngVideo()
            case ParameterConstants.italianLanguage:
                videoPlayerManager.playItaVideo()
            case ParameterConstants.koreanLanguage:
                videoPlayerManager.playKoreanVideo()
            default:
                videoPlayerManager.playEngVideo()
            }
        }
        .onDisappear() {
            videoPlayerManager.videoPlayerEng.pause()
            MenuView()
                .transition(.slide)
        }
        
//        if videoPlayerManager.videoDone {
////            NavigationLink("SKIP", destination: MenuView(), isActive: $videoPlayerManager.videoDone)
//            MenuView()
//                .transition(AnyTransition.move(edge: .trailing)).animation(.default)
//        }
    }
}

struct AVPlayerControllerRepresented : NSViewRepresentable {
    var videoPlayer : AVPlayer
    
    func makeNSView(context: Context) -> AVPlayerView {
        let view = AVPlayerView()
        view.controlsStyle = .none
        view.player = videoPlayer
        return view
    }
    
    func updateNSView(_ nsView: AVPlayerView, context: Context) {
        
    }
}

struct SkipButtonView: View {
    let skipButton: LocalizedStringKey = "Skip"
    
    @State private var isHoveringSkip = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                        .frame(height: 100)
                    Button(
                        action: {
                            // write action
                            print("Skip Button is Clicked")
                        },
                        label: {
                            Text(skipButton)
                                .font(.custom(ParameterConstants.sigismundoFont, size: 30))
                                .foregroundColor(isHoveringSkip ? Color("MenuBlue") : Color.red)
                        }
                    )
                    .cornerRadius(8)
                    .buttonStyle(BorderlessButtonStyle())
                    .padding(.horizontal, 20)
                    .onHover { hovering in
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isHoveringSkip = hovering
                        }
                    }
                }
            }
        }
    }
}
