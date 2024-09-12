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

    @EnvironmentObject var globalState: ShapeGlobalState
    @State private var count: Int = 40
    @State private var size:Float = 1.0
    @State private var realityViewContent: RealityViewContent?
    
    @State var allModels:[Entity] = []
    
    mutating func SetModels (model:Entity) {
        allModels.append(model)
    }
    
    func GetRandomPosition () -> Float{
        let randomVal = Float(Int.random(in: -10..<10))
        return randomVal
    }

    func GetRandomSize() -> Float{
        let randomVal = Float(Int.random(in: 1..<10))
        return randomVal
    }
    
    func AddSpheres() -> Void {
        realityViewContent?.entities.removeAll()
        withAnimation{
            
            for _ in 1...count {

                let model = ModelEntity(
                    mesh: .generateSphere(radius: GetRandomSize() * 0.1),
                    materials: [SimpleMaterial(color: .white, isMetallic: true)])
                model.position = SIMD3<Float>(GetRandomPosition(),GetRandomPosition(),GetRandomPosition())
        
                allModels.append(model)
                realityViewContent?.add(model)
            }
        }
    }
    
    var body: some View {

        RealityView { content in
            realityViewContent = content
            let anchor = AnchorEntity()

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

#Preview (immersionStyle: .automatic){
    SphereView()
}
