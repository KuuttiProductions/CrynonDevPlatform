//
//  CrynonDevPlatformApp.swift
//  CrynonDevPlatform
//
//  Created by Kuutti Taavitsainen on 9.12.2023.
//

import SwiftUI
import Crynon

@main
struct CrynonDevPlatformApp: App {
    
    private var core: Core!
    
    init() {
        self.core = Crynon.Core()
        loadAssets()
        SceneManager.changeScene(DevScene())
        Preferences.core.defaultFPS = 60
        Preferences.graphics.useSkySphere = true
        Preferences.graphics.clearColor = MTLClearColor(red: 0.5, green: 0.7, blue: 1, alpha: 1)
    }
    
    func loadAssets() {
        AssetLibrary.textures.addTexture(textureName: "Grass", origin: .topLeft)
        AssetLibrary.textures.addTexture(textureName: "Window")
        AssetLibrary.textures.addTexture(textureName: "OceanSky", origin: .topLeft)
        AssetLibrary.textures.addTexture(textureName: "Wallpaper", ext: "jpeg")
        AssetLibrary.textures.addTexture(textureName: "mudC")
        AssetLibrary.textures.addTexture(textureName: "mudI")
        AssetLibrary.textures.addTexture(textureName: "mudN")
        AssetLibrary.textures.addTexture(textureName: "debugNormal")
        
        AssetLibrary.meshes.addMesh(meshName: "Shape")
        AssetLibrary.meshes.addMesh(meshName: "UVCube")
        AssetLibrary.meshes.addMesh(meshName: "Plane")
    }
    
    var body: some SwiftUI.Scene {
        WindowGroup {
            DefaultView()
        }
    }
}
