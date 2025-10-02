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
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 20) {
                HStack {
                    Text("Step Tracker")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    Spacer()
                    Toggle("", isOn: Binding(get: { vm.usingMock }, set: { vm.setMockMode($0) }))
                        .labelsHidden()
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                Spacer()
                
                VStack(spacing: 8) {
                    Text("Steps")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundStyle(.white)
                        
                    
                    Text("\(vm.steps)")
                        .font(.system(size: 100, weight: .bold, design: .rounded))
                        .monospacedDigit()
                        .foregroundStyle(.white)
                }
                .padding(.top, 20)
                
                HStack(spacing: 30) {
                    Label(vm.distanceKMText, systemImage: "figure.walk")
                    Label("\(vm.floorsAscended ?? 0) floors", systemImage: "building.2")
                }
                .font(.system(size: 25))
                .foregroundStyle(.gray)
                
                Spacer()
                
                HStack(spacing: 12) {
                    Button("Start") { vm.start() }
                        .buttonStyle(.borderedProminent)
                        .tint(.white)
                        .foregroundColor(.blue)
                        .clipShape(Capsule())
                    
                    Button("Stop") { vm.stop() }
                        .buttonStyle(.bordered)
                        .tint(.gray)
                    
                    Button("Reset Session") { vm.resetSession() }
                        .buttonStyle(.bordered)
                        .tint(.gray)
                }
                .padding(.horizontal)
                
                Text(vm.statusText)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.top, 8)
                
                if let err = vm.errorMessage {
                    Text(err)
                        .font(.caption)
                        .foregroundStyle(.red)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    PedometerView()
}
