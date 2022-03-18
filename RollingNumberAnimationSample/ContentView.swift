//
//  ContentView.swift
//  RollingNumberAnimationSample
//
//  Created by hiraoka on 2022/03/18.
//

import SwiftUI

struct ContentView: View {
    @State var number = 0

    var body: some View {
        VStack(spacing: 32) {
            Text(number.description)
                .modifier(RollingNumberAnimation(number: number))

            Button("+10") {
                withAnimation {
                    number += 10
                }
            }

            Button("+100") {
                withAnimation {
                    number += 100
                }
            }
        }
    }
}

struct RollingNumberAnimation: AnimatableModifier {
    var number: Int

    var animatableData: CGFloat {
        get { CGFloat(number) }
        set { number = Int(newValue) }
    }

    func body(content: Content) -> some View {
        Text(number.description)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
