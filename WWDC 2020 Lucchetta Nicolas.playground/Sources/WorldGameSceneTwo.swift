

import SpriteKit

public class WorldSceneTwo: SKScene, SKPhysicsContactDelegate {
    var textSpot : SKSpriteNode!
    var kiko: SKSpriteNode!
    var paris: SKSpriteNode!
    var napoli: SKSpriteNode!
    var sanFrancisco: SKSpriteNode!
    var canada: SKSpriteNode!
    var textSpace: SKSpriteNode!
    var nextBtn : SKSpriteNode!
    var textLabel : SKLabelNode!
    
    
    var text = 0
    override public func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        let bg = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "world-map-for-drawing-27.jpg")))
        bg.setScale(0.205)
        bg.position = CGPoint(x: frame.midX * 0.975, y: frame.midY * 0.9)
        addChild(bg)
        
        napoli = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "shield.png")), color: .clear, size: CGSize(width: size.width * 0.08, height: size.height * 0.08))
        paris = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "building.png")), color: .clear, size: CGSize(width: size.width * 0.12, height: size.height * 0.12))
        sanFrancisco = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "building-2.png")), color: .clear, size: CGSize(width: size.width * 0.1, height: size.height * 0.1))
        canada = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "world.png")), color: .clear, size: CGSize(width: size.width * 0.1, height: size.height * 0.1))
        kiko = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "faceKiko.png")), color: .clear, size: CGSize(width: size.width * 0.1, height: size.height * 0.1))
        
        kiko.position =  CGPoint(x: frame.midX * 0.92, y: frame.midY * 1.5)
        canada.position = CGPoint(x: frame.midX / 2, y: frame.midY * 1.4)
        paris.position = CGPoint(x: frame.midX * 0.95, y: frame.midY * 1.4)
        napoli.position = CGPoint(x: frame.midX * 1.05 , y: frame.midY * 1.2)
        sanFrancisco.position = CGPoint(x: frame.midX / 3, y: frame.midY * 1.3)
        
        addChild(canada)
        addChild(sanFrancisco)
        addChild(paris)
        addChild(napoli)
        addChild(kiko)
        
        nextBtn = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "multimedia.png")), color: .clear, size: CGSize(width: size.width * 0.1, height: size.height * 0.1))
        
        
        textSpace = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "Capture d’écran 2020-05-13 à 15.32.36.png")), color: .clear, size: CGSize(width: 0, height: 0))
        textSpace.position = CGPoint(x: frame.midX / 1.5, y: frame.midY * 0.64)
        addChild(textSpace)
        
        nextBtn.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(nextBtn)
        
        textLabel = SKLabelNode(text: "")
        textLabel.horizontalAlignmentMode = .left
        textLabel.verticalAlignmentMode = .top
        textLabel.position = CGPoint(x: frame.midX / 2.8, y: frame.midY * 0.85)
        textLabel.numberOfLines = 4
        textLabel.fontName = "Impact"
        textLabel.fontSize = 25
        textLabel.fontColor = .black
        addChild(textLabel)
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        let touchNodes = nodes(at: touchLocation)
        for node in touchNodes {
            if node == nextBtn {
                nextBtn.removeFromParent()
                textSpace.size = CGSize(width: size.width * 0.35, height: size.height * 0.27)
                RunLoop.current.run(until: Date()+0.1)
                displayText()
            }
        }
    }
    
    func displayText() {
        var speech1 = "Thank you!" + "\n" + "You have been a great help!"
        var speech2 = "I resigned from Nike," + "\n" + "done a bootcamp," + "\n" + "a concours for a TechSchool," + "\n" + "and candidated to others." 
        var speech21 = "The great news is" + "\n" + "\n" + ".  .  ."
        var speech3 = "I HAVE BEEN SELECTED" + "\n" + "FOR" + "\n" + "APPLE DEVELOPER ACADEMY!!!"
        var speech4 = "So in Octber 19" + "\n" + "I moved to Naples, in Italy." + "\n" + "To face my new challenges!"
        var speech5 = "Help me catch them all!"
        
        var speeches = [speech1, speech2,speech21, speech3,speech4, speech5]
        for speech in speeches {
            textLabel.text = ""
            if speech == speech3 {
                let newPlayerposition = CGPoint(x: kiko.position.x - (paris.position.x - napoli.position.x), y: kiko.position.y - (paris.position.y - napoli.position.y))
                kiko.run(SKAction.move(to: newPlayerposition, duration: 2))
            }
            for i in speech {
                textLabel.removeFromParent()
                textLabel.text! += "\(i)"
                addChild(textLabel)
                RunLoop.current.run(until: Date()+0.04)
            }
            RunLoop.current.run(until: Date()+1.0)
        }
        perform(#selector(gotoGameScene), with: nil, afterDelay: 1.2)
    }
    
    @objc func gotoGameScene(){
        let scenetwo = NapoliGameScene(size: UIScreen.main.bounds.size)
        scenetwo.scaleMode = .aspectFill
        view?.presentScene(scenetwo, transition: SKTransition.fade(withDuration: 0.5))
    }
}
