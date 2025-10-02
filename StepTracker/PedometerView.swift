//
//  PedometerView.swift
//  StepTracker
//
//  Created by Roy Dimapilis on 10/1/25.
//

import SwiftUI

struct PedometerView: View {
    @StateObject private var vm = PedometerViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Steps").font(.headline)
            Text("\(vm.steps)")
                .font(.system(size: 64, weight: .bold, design: .rounded))
                .monospacedDigit()
            
            HStack {
                Label(vm.distanceKMText, systemImage: "figure.walk.motion")
                Divider().frame(height: 20)
                Label("\(vm.floorsAscended ?? 0) floors",  systemImage: "building.2")
    
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
            
            HStack {
                Button("Start") { vm.start() }.buttonStyle(.borderedProminent)
                Button("Stop") { vm.stop() }.buttonStyle(.bordered)
                
            }
            Text(vm.statusText).font(.footnote)
            if let err = vm.errorMessage {
                Text(err).font(.footnote).foregroundStyle(.red)
            }
        }
        .padding()
    }
}
