//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Qi Han on 11/1/25.
//

import SwiftUI

@main
struct MemorizeApp: App {
    // Every App needs a body.
    // The body returns some Scene (场景) which could be one or multiple windows.
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// The data flow: App -> Scene -> View.
// Note: The Scene is kind of like a Window, but iOS only needs one Scene.
// MacOS could have multiple Scene, e.g. Chrome new window.
