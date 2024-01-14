//
//  ContentView.swift
//  ToDo
//
//  Created by Danielle Lewis on 1/13/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            List {
                Text("Item")
            }
            .navigationTitle("Sidebar")
        } detail: {
            
            VStack {
                Model3D(named: "Scene", bundle: realityKitContentBundle)
                    .padding(.bottom, 50)
                
                Text("Hello, world!")
            }
            .padding()
            .navigationTitle("Content")
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
