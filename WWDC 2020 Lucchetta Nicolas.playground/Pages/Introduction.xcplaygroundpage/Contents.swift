
import SpriteKit
import UIKit
import PlaygroundSupport
import SwiftUI

/* 
 
 WELCOME TO KIKO'S PLAYGROUND!
 
 THROUGH THIS PLAYGROUND I'M GONNA TELL YOU MY STORY!
 
 WE HAVE THREE MAJOR EVENTS IN THIS TALE!
 
 BE SURE YOU DON'T MISS ANY PAGE OF IT!
 
 HOPE YOU WILL ENJOY THE TRIP!!
 
 */
let sceneView = SKView(frame: .zero)
let worldScene =  WorldSceneOne(size: UIScreen.main.bounds.size)
worldScene.scaleMode = .aspectFill
sceneView.presentScene(worldScene)
PlaygroundPage.current.liveView = sceneView
PlaygroundPage.current.wantsFullScreenLiveView = true


