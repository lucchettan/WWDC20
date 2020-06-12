 import SpriteKit
import UIKit
import PlaygroundSupport
import SwiftUI

let sceneView = SKView(frame: .zero)
let worldScene =  WorldSceneTwo(size: UIScreen.main.bounds.size)
worldScene.scaleMode = .aspectFill





sceneView.presentScene(worldScene)
PlaygroundPage.current.liveView = sceneView
//Display the code in a fullscreen view
PlaygroundPage.current.wantsFullScreenLiveView = true
