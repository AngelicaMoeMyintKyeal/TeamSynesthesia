//
//  IntroVideoView.swift
//  Amotus Vessel
//
//  Created by Htet Myat Moe Myint Kyeal on 02/03/23.
//

import AVKit
import SwiftUI

struct IntroVideoView: View {
        
    let videoPlayer = AVPlayer(url: Bundle.main.url(forResource: "IntroVideoEng", withExtension: "mov")!)
    var body: some View {
        
            VStack {
                AVPlayerControllerRepresented(videoPlayer: videoPlayer)
            }
            .onAppear() {
                videoPlayer.play()
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


/*
 import Foundation
 import SpriteKit

 class VideoManager: SKNode {
     
     var entityManager: EntityManager!
     var deviceLanguage = Locale.current.languageCode

     func languageForVideo(deviceLang: String) {
         switch deviceLang {
         case ParameterConstants.englishLanguage:
             playPrologueVideo(fileName: ParameterConstants.englishPrologueVid)
         case ParameterConstants.italianLanguage:
             playPrologueVideo(fileName: ParameterConstants.italianPrologueVid)
         case ParameterConstants.koreanLanguage:
             playPrologueVideo(fileName: ParameterConstants.koreanPrologueVid)
         default:
             playPrologueVideo(fileName: ParameterConstants.englishPrologueVid)
         }
     }
     
     func playPrologueVideo(fileName: String) {
         let prologueVideo = SKVideoNode(fileNamed: fileName)
         prologueVideo.position = CGPoint(x: frame.midX, y: frame.midY)
         addChild(prologueVideo)
         prologueVideo.play()
     }
     
 }

 */
