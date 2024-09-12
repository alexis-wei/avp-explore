//
//  StartView.swift
//  immersive
//
//  Created by Alexis Wei on 9/10/24.
//

import SwiftUI

struct StartView: View {
    @State var selectionMode = false
    @EnvironmentObject var globalState: GlobalState
    
    let numLevels = 2
    
    func selectionModeToggle() {
        selectionMode = !selectionMode
        print(selectionMode)
    }
    
    func setLevel(level:Int){
        globalState.level = level
        globalState.currentScene = .game
    }
    
    var body: some View {
        VStack(spacing: 60){
            Text("welcome to alexis' immersive playground").font(.system(size:80, weight: .regular)).multilineTextAlignment(.center)
            if selectionMode {
                HStack(spacing: 20) {
                    ForEach(1...numLevels, id: \.self) { level in
                        Button("0"+String(level), action: {setLevel(level:level)}).padding(.horizontal, 8).padding(.vertical, 12).buttonBorderShape(.roundedRectangle(radius: 8)).font(.system(size: 28))
                    }
                }
            } else {
                Button(action: selectionModeToggle) {
                    Label("  Pick a level", systemImage: "key")
                        .font(.system(size: 36))
                        .padding(.horizontal, 32).padding(.vertical, 16)
                }
            }

        }
       
    }
}

#Preview {
    StartView()
}
