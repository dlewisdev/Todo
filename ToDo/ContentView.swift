//
//  ContentView.swift
//  ToDo
//
//  Created by Danielle Lewis on 1/13/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            List {
                Text("Item")
            }
            .navigationTitle("Sidebar")
        } detail: {
            
            VStack {
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
