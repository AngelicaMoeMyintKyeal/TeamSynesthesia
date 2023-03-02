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
    @StateObject var videoPlayerManager = VideoPlayerManager()
    
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

struct SkipButtonView: View {
    
    var body: some View {
    
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(
                        action: {
                            // write action
                            print("Skip Button is Clicked")
                        },
                        label: {
                            VStack(alignment: .center) {
                                Image("SkipButton")
//                                    .resizable()
//                                    .padding()
                                    .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: geometry.size.width / 10)
                            }
                        }
                    )
                    .frame(height: 44)
                    .padding(.horizontal, 20)
                    .cornerRadius(8)
                    Spacer()
                }
            }
        }
    }
}
