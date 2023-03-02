//
//  IntroVideoView.swift
//  Amotus Vessel
//
//  Created by Htet Myat Moe Myint Kyeal on 02/03/23.
//

import AVKit
import SwiftUI

struct IntroVideoView: View {
       
    var deviceLang: String

    let videoPlayerEng = AVPlayer(url: Bundle.main.url(forResource: "IntroVideoEng", withExtension: "mov")!)
    let videoPlayerIta = AVPlayer(url: Bundle.main.url(forResource: "IntroVideoIta", withExtension: "mov")!)
    let videoPlayerKorean = AVPlayer(url: Bundle.main.url(forResource: "IntroVideoEng", withExtension: "mov")!)
    var body: some View {
        
            VStack {
//                AVPlayerControllerRepresented(videoPlayer: videoPlayer)
                
                switch deviceLang {
                case ParameterConstants.englishLanguage:
                    AVPlayerControllerRepresented(videoPlayer: videoPlayerEng)
                case ParameterConstants.italianLanguage:
                    AVPlayerControllerRepresented(videoPlayer: videoPlayerIta)
                case ParameterConstants.koreanLanguage:
                    AVPlayerControllerRepresented(videoPlayer: videoPlayerKorean)
                default:
                    AVPlayerControllerRepresented(videoPlayer: videoPlayerEng)
                }
            }
            .onAppear() {
                switch deviceLang {
                case ParameterConstants.englishLanguage:
                    videoPlayerEng.play()
                case ParameterConstants.italianLanguage:
                    videoPlayerIta.play()
                case ParameterConstants.koreanLanguage:
                    videoPlayerKorean.play()
                default:
                    videoPlayerEng.play()
                }
            }
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

//struct IntroVideoView_Previews: PreviewProvider {
//    static var previews: some View {
//        IntroVideoView()
//    }
//}
