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
        ZStack {
            VStack(spacing: 0) {
                Color.black
                Color.white
                Color.black
                Color.white
            }
            VStack(spacing: 0) {
                Color.white
                Color.pink
                Color.yellow
                Color.black
            }
            .overlay {
                dynamicRectangle
                    .blendMode(.destinationOut)
            }
            .compositingGroup()
        }
        .ignoresSafeArea()
    }
    
    var dynamicRectangle: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .frame(width: 100, height: 100)
            .foregroundColor(.white)
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
                        self.lastOffset = self.offset // Сохраняем последнее положение
                    }
            )
    }
}


#Preview {
    ContentView()
}
