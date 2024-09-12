//
//  GlobalState.swift
//  immersive
//
//  Created by Alexis Wei on 9/6/24.
//

import SwiftUI

class GlobalState: ObservableObject {
    @Published var level: Int = 0
    @Published var currentScene: SceneType = .start
    
    enum SceneType {
        case start, game
    }
}


class ShapeGlobalState: ObservableObject {
    @Published var regenerate: Bool = false
}

