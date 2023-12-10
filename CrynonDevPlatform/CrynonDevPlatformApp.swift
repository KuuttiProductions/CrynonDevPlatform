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
        Preferences.useSkySphere = true
    }
    
    func loadAssets() {
        AssetLibrary.textures.addTexture(textureName: "Grass", origin: .topLeft)
        AssetLibrary.textures.addTexture(textureName: "Window")
        AssetLibrary.textures.addTexture(textureName: "OceanSky", origin: .topLeft)
        AssetLibrary.textures.addTexture(textureName: "Wallpaper", ext: "jpeg")
    }
    
    var body: some SwiftUI.Scene {
        WindowGroup {
            DefaultView()
        }
    }
}
