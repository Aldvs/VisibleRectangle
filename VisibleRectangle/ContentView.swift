//
//  ContentView.swift
//  VisibleRectangle
//
//  Created by admin on 13.05.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var offset = CGSize.zero
    @State private var lastOffset = CGSize.zero
    
    var body: some View {
        VStack(spacing: 0) {
            Color.white
            Color.pink
            Color.yellow
            Color.black
        }
        .overlay {
            dynamicRectangle.foregroundColor(.white)
                .blendMode(.difference)
                .overlay(dynamicRectangle.blendMode(.hue))
                .overlay(dynamicRectangle.foregroundColor(.white).blendMode(.overlay))
                .overlay(dynamicRectangle.foregroundColor(.black).blendMode(.overlay))
        }
        .ignoresSafeArea()
    }
    
    
    var dynamicRectangle: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .frame(width: 100, height: 100)
            .offset(offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        self.offset = CGSize(
                            width: self.lastOffset.width + gesture.translation.width,
                            height: self.lastOffset.height + gesture.translation.height
                        )
                    }
                    .onEnded { gesture in
                        self.lastOffset = self.offset
                    }
            )
    }
}

#Preview {
    ContentView()
}
