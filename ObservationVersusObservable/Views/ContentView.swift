//
//  ContentView.swift
//  ObservationVersusObservable
//
//  Created by Didier Delhaisse on 16/06/2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    private var vm = ContentViewModel()
    private var vm2 = ContentViewModeliOS16ObservableMacro()
    @StateObject private var vm3 = ContentViewModeliOS16()
    
    
    // MARK: - Body
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            GroupBox("Observation versus Observable") {
                VStack(alignment: .leading, spacing: 12) {
                    Text(vm.someText)
                    Text(vm2.someText)
                    Text(vm3.someText)
                }
            }
            .padding()
        }
        
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
