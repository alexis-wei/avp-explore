//
//  immersiveApp.swift
//  immersive
//
//  Created by Alexis Wei on 9/3/24.
//

import SwiftUI

@main
struct immersiveApp: App {
    @StateObject private var globalState = GlobalState()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(globalState)
        }.windowStyle(.volumetric)


        ImmersiveSpace(id: "ImmersiveSpace") {
//            ImmersiveView()
            SphereView().environmentObject(globalState)
        }.immersionStyle(selection: .constant(.full), in: .full)
        
    

    }
}
