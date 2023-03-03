//
//  VideoPlayerManager.swift
//  Amotus Vessel
//
//  Created by Htet Myat Moe Myint Kyeal on 02/03/23.
//

import AVKit
import SwiftUI

class VideoPlayerManager: ObservableObject {
    
    @Published private var playing = false
    
    let videoPlayerEng = AVPlayer(url: Bundle.main.url(forResource: "IntroVideoEng", withExtension: "mp4")!)
    let videoPlayerIta = AVPlayer(url: Bundle.main.url(forResource: "IntroVideoIta", withExtension: "mp4")!)
    let videoPlayerKorean = AVPlayer(url: Bundle.main.url(forResource: "IntroVideoEng", withExtension: "mp4")!)
    
    func playEngVideo() {
            videoPlayerEng.play()
            playing = true
    }
    
    func playItaVideo() {
            videoPlayerIta.play()
            playing = true
    }
    
    func playKoreanVideo() {
            videoPlayerKorean.play()
            playing = true
    }
        
//    func playPause() {
//        if playing {
//            videoPlayerEng.pause()
//        } else {
//            videoPlayerEng.play()
//        }
//        playing.toggle()
//    }
}
