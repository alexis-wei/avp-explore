//
//  immersiveApp.swift
//  immersive
//
//  Created by Alexis Wei on 9/3/24.
//

import SwiftUI

@main
struct immersiveApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.volumetric)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
