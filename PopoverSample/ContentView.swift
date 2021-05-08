//
//  ContentView.swift
//  PopoverSample
//
//  Created by Masaaki Uno on 2021/05/08.
//

import SwiftUI

struct ContentView: View {
    @State var isVisible = false
    @State var flag = false
    @State var scale: CGFloat = 1.0
    
    var body: some View {
        VStack {
            ZStack {
                // エンドレスアニメーション
                Circle()
                    .size(width: 200, height: 200)
                    .offset(x: -100, y: -100)
                    .scale(scale, anchor: .zero)
                    .offset(x: 200, y: 100)
                    .fill(Color.red)
                    .onAppear() {
                        let anim = Animation
                            .easeInOut(duration: 1)
                            .repeatForever(autoreverses: true)
                        return withAnimation(anim) {
                            self.scale = 0.5
                        }
                    }

            }
                
            Text("Hello, world!")
                .padding()
//                .onTapGesture {
//                    isVisible = true
//                }
            Button("Please Tap!", action: {
                withAnimation {
                    flag = true
                }
            })
            Divider()
            
            HStack {
                Text(flag ? "ANIMATION" : "TRANSITION")
                    .font(.headline)
                    .frame(width: 300, height: 50, alignment: .center)
                    .foregroundColor(flag ? .white : .black)
                    .background(self.flag ? Color.red : Color.yellow)
                    .animation(.default)
            }
        }.popover(isPresented:  $isVisible) {
            VStack {
                Text("Popover")
                    .onTapGesture {
                        isVisible = false
                    }
                Divider()
                Button("close", action: {
                    withAnimation {
                        isVisible.toggle()
                    }
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
