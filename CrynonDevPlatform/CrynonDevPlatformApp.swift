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
        SceneManager.changeScene(DevScene())
    }
    
    var body: some SwiftUI.Scene {
        WindowGroup {
            DefaultView()
        }
    }
}
