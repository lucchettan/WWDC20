

import SpriteKit

public class WorldSceneOne: SKScene, SKPhysicsContactDelegate {
    var textSpot : SKSpriteNode!

    var text = 1
    
    var textSpace: SKSpriteNode!
    var nextBtn : SKSpriteNode!
    var textLabel : SKLabelNode!
    var kiko : SKSpriteNode!
    
    override public func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        let bg = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "world-map-for-drawing-27.jpg")))
        bg.setScale(0.205)
        bg.position = CGPoint(x: frame.midX * 0.975, y: frame.midY * 0.9)
        addChild(bg)
        
        let napoli = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "shield.png")), color: .clear, size: CGSize(width: size.width * 0.08, height: size.height * 0.08))
        let paris = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "building.png")), color: .clear, size: CGSize(width: size.width * 0.15, height: size.height * 0.15))
        let sanFrancisco = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "building-2.png")), color: .clear, size: CGSize(width: size.width * 0.1, height: size.height * 0.1))
        let canada = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "world.png")), color: .clear, size: CGSize(width: size.width * 0.1, height: size.height * 0.1))
        kiko = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "faceKiko.png")), color: .clear, size: CGSize(width: size.width * 0.35, height: size.height * 0.35))
        
        kiko.position =  CGPoint(x: frame.midX, y: frame.midY * 0.4)
        paris.position = CGPoint(x: frame.midX * 0.95, y: frame.midY * 1.4)
        napoli.position = CGPoint(x: frame.midX * 1.05 , y: frame.midY * 1.2)
        sanFrancisco.position = CGPoint(x: frame.midX / 3, y: frame.midY * 1.3)
        canada.position = CGPoint(x: frame.midX / 2, y: frame.midY * 1.4)
        
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
        textLabel.numberOfLines = 3
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
                //text += 1
                //textSpot.texture = SKTexture(image: #imageLiteral(resourceName: "1__#$!@%!#__text2.png"))
                //displayText()
                nextBtn.removeFromParent()
                let newPlayerposition =  CGPoint(x: frame.midX * 0.87, y: frame.midY * 1.4)
                let newKikoSize = CGSize(width: size.width * 0.15, height: size.height * 0.15)
                kiko.size = newKikoSize
                kiko.run(SKAction.move(to: newPlayerposition, duration: 4))
                
                
                textSpace.size = CGSize(width: size.width * 0.35, height: size.height * 0.27)
                RunLoop.current.run(until: Date()+0.1)
                displayText()
            }
        }
    }
    
    func displayText() {
        var speech1 = "Hi I'm Nicolas!" + "\n" + "You can call me Kiko!"
        var speech2 = "I'm a 24 Years old" + "\n" + "from Paris!" 
        var speech21 = "I used to work at AirFrance," + "\n" + "Bataclan and Nike but..."
        var speech3 = "Since January 2019," + "\n" + "I am trying to change" + "\n" + "my life."
        var speech4 = "So join the adventure!" + "\n" + "Help me to catch good habits" + "\n" + "Go on the next page," + "\n" + "and run the code!" 
        
        var speeches = [speech1, speech2,speech21, speech3,speech4]
        for speech in speeches {
            textLabel.text = ""
            for i in speech {
                textLabel.removeFromParent()
                // textLabel.position = CGPoint(x: 500, y: 450)
                textLabel.text! += "\(i)"
                addChild(textLabel)
                RunLoop.current.run(until: Date()+0.04)
            }
            RunLoop.current.run(until: Date()+1.0)
        }
    }
}
