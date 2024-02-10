//
//  WellScene.swift
//  CrynonDevPlatform
//
//  Created by Kuutti Taavitsainen on 10.2.2024.
//

import Crynon

class WellScene: Scene {
    
    var camera = DevCamera()
    var well = GameObject("Well")
    
    init() {
        super.init("WellScene")
        addChild(well)
        addCamera(camera)
        well.addPosZ(-2)
        well.material.textureColor = "well-diff"
        well.material.textureNormal = "well-nor"
    }
}
