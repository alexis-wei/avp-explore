//
//  immersiveApp.swift
//  immersive
//
//  Created by Alexis Wei on 9/3/24.
//

import SwiftUI

@main
struct immersiveApp: App {
    @StateObject var globalState = GlobalState()
    @StateObject private var shapeGlobalState = ShapeGlobalState()
    
    
    var body: some Scene {
        WindowGroup {
            if globalState.currentScene == .start {
                StartView().environmentObject(globalState)
            } else {
                switch globalState.level {
                case 1:
                    ContentView().environmentObject(shapeGlobalState)
                default:
                    EmptyView()
                }
            }
        }.windowStyle(.volumetric)
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            switch globalState.level{
            case 1:
                SphereView().environmentObject(shapeGlobalState)
            default:
                EmptyView()
            }
        }.immersionStyle(selection: .constant(.mixed), in: .mixed)
    }
    
    
}
