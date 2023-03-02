//
//  MenuView.swift
//  Amotus Vessel
//
//  Created by Htet Myat Moe Myint Kyeal on 02/03/23.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
    
        GeometryReader { geometry in
            VStack {
                Spacer()
                Text("Amotus Vessel")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Button(
                    action: {
                        // write action
                        print("Play Button is Clicked")
                    },
                    label: {
                            Text("Play Game")
                            .frame(
                                maxWidth: geometry.size.width / 3)
                    }
                )
//                .buttonStyle(.borderedProminent)
                .frame(height: 44)
                .padding(.horizontal, 20)
                .cornerRadius(8)
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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
