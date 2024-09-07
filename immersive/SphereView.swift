//
//  SphereView.swift
//  immersive
//
//  Created by Alexis Wei on 9/4/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct SphereView: View {

    @EnvironmentObject var globalState: GlobalState
    @State private var count: Int = 5
    @State private var size:Float = 1.0
    @State private var location:SIMD3<Float> = [1.0, 1.0, 1.0]
    @State private var realityViewContent: RealityViewContent?
    
    @State var allModels:[Entity] = []
    
    mutating func SetModels (model:Entity) {
        allModels.append(model)
    }
    
    func GetRandom () -> Float{
        let randomVal = Float(Int.random(in: -10..<10))
        return randomVal
    }
    
    func AddSpheres() -> Void {
        print("AddSpheres called")
        realityViewContent?.entities.removeAll()
        for _ in 1...count {
            let model = ModelEntity(
                mesh: .generateSphere(radius: 0.2),
                         materials: [SimpleMaterial(color: .white, isMetallic: true)])
            model.position = SIMD3<Float>(GetRandom(),GetRandom(),GetRandom())
            allModels.append(model)
            realityViewContent?.add(model)
        }
    }
    
    var body: some View {

        RealityView { content in
            realityViewContent = content
//            let anchor = AnchorEntity(.plane(.horizontal,
//                                             classification: .any,
//                                             minimumBounds: SIMD2<Float>(0.2, 0.2)
//                         ))

            AddSpheres()
            

        }.onChange(of: globalState.regenerate){ _, newValue in
            print("newValue:", newValue)
            if (newValue) {
                print("regenerate happening")
                AddSpheres()
                globalState.regenerate = false
            }
        }
    }
}

#Preview (immersionStyle: .full){
    SphereView()
}
