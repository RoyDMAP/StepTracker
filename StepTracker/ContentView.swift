//
//  ContentView.swift
//  StepTracker
//
//  Created by Roy Dimapilis on 10/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack(spacing: 16) {
                Image(systemName: "figure.walk")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(.white)

                HStack(spacing: 12) {
                    Button("Start") { /* vm.start() */ }
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                        .clipShape(Capsule())

                    Button("Stop") { /* vm.stop() */ }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                        .clipShape(Capsule())

                    Button("Reset") { /* vm.reset() */ }
                        .buttonStyle(.borderedProminent)
                        .tint(.blue)
                        .clipShape(Capsule())
                }
            }
            .padding(.top, 40)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
}

#Preview {
    ContentView()
}
