//
//  ContentView.swift
//  RollingNumberAnimationSample
//
//  Created by hiraoka on 2022/03/18.
//

import SwiftUI

final class ViewModel: ObservableObject {
    @Published var number: Int = 0

    func increment(adding: Int) {
        withAnimation {
            number += adding
        }
    }
}

struct ContentView: View {
    @StateObject var viewModel: ViewModel = .init()

    var body: some View {
        VStack(spacing: 32) {
            RollingNumberAnimatableView(number: viewModel.number)
                .frame(width: 100)

            Button("+10") {
                viewModel.increment(adding: 10)
            }

            Button("+100") {
                viewModel.increment(adding: 100)
            }
        }
    }
}

struct RollingNumberAnimatableView: View, Animatable {
    var number: Int

    var animatableData: CGFloat {
        get { CGFloat(number) }
        set { number = Int(newValue) }
    }

    var body: some View {
        Text("\(number) 件")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
