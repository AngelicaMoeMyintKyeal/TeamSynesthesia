//
//  IntroVideoView.swift
//  Amotus Vessel
//
//  Created by Htet Myat Moe Myint Kyeal on 02/03/23.
//

import AVKit
import SwiftUI

struct IntroVideoView: View {
    
    var body: some View {
        
        NavigationView() {
            VStack {
//                VideoPlayer(player: player)
//                    .onAppear()
//                VideoPlayer(
//                    player: AVPlayer(url: URL(fileURLWithPath: engIntroVideoPath)))
            }
        }
    }
}

/*
 Bundle.main.url(forResource: "video", withExtension: "mp4")!)
 */
struct IntroVideoView_Previews: PreviewProvider {
    static var previews: some View {
        IntroVideoView()
    }
}


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
