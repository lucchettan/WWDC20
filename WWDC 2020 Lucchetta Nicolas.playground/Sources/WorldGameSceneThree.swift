


import SpriteKit

public class WorldSceneThree: SKScene, SKPhysicsContactDelegate {
    var textSpot : SKSpriteNode!
    var kiko: SKSpriteNode!
    var paris: SKSpriteNode!
    var napoli: SKSpriteNode!
    var sanFrancisco: SKSpriteNode!
    var canada: SKSpriteNode!
    var textSpace: SKSpriteNode!
    var nextBtn : SKSpriteNode!
    var textLabel : SKLabelNode!
    
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
        
        sanFrancisco.position = CGPoint(x: frame.midX / 3, y: frame.midY * 1.3)
        canada.position = CGPoint(x: frame.midX / 2, y: frame.midY * 1.4)
        paris.position = CGPoint(x: frame.midX * 0.95, y: frame.midY * 1.4)
        napoli.position = CGPoint(x: frame.midX * 1.05 , y: frame.midY * 1.2)
        kiko.position =  CGPoint(x: frame.midX * 0.92, y: frame.midY * 1.5)
        kiko.position = CGPoint(x: kiko.position.x - (paris.position.x - napoli.position.x), y: kiko.position.y - (paris.position.y - napoli.position.y))

        addChild(canada)
        addChild(sanFrancisco)
        addChild(paris)
        addChild(napoli)
        addChild(kiko)
        
        textSpace = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "Capture d’écran 2020-05-13 à 15.32.36.png")), color: .clear, size: CGSize(width: 0, height: 0))
        textSpace.position = CGPoint(x: frame.midX / 1.5, y: frame.midY * 0.64)
        addChild(textSpace)
        textLabel = SKLabelNode(text: "")
        textLabel.horizontalAlignmentMode = .left
        textLabel.verticalAlignmentMode = .top
        textLabel.position = CGPoint(x: frame.midX / 2.8, y: frame.midY * 0.85)
        textLabel.numberOfLines = 4
        textLabel.fontName = "Impact"
        textLabel.fontSize = 25
        textLabel.fontColor = .black
        addChild(textLabel)
        textSpace.size = CGSize(width: size.width * 0.35, height: size.height * 0.27)
        RunLoop.current.run(until: Date()+0.1)
        perform(#selector(displayText), with: nil, afterDelay: 0.5)
        
    }
    
    @objc func displayText() {
        var speech1 = "We did it!" + "\n" + "The Apple Developer Academy" + "\n" + "Challenges!" 
        var speech12 = "It taught us so much!!!" + "\n" + "I will never forget it!"
        var speech2 = "I dreamed about" + "\n" + "going to San Francisco" + "\n" + "for the WWDC2020!"
        var speech21 = "Suddenly the covid..." + "\n" + "Back home for everyone."
        var speech3 = "But be sure that the journey" + "\n" + "just got started!" + "\n" + "I am starving for" + "\n" + "new adventures!"
        var speech4 = "I will do my best to get" + "\n" + "a position as iOS developer" + "\n" + "in Canada!"
        var speech5 = "I hope you enjoyed" + "\n" + "the tale of my last 18months!" 
        var speech51 = "The Academy is not even" + "\n" + "over yet. There will be" + "\n" + "more for me to come!"
        var speech6 = "Hoping all of you" + "\n" + "are safe and well!" + "\n" + "Take care of your family!" 
        var speeches = [speech1, speech12, speech2,speech21, speech3, speech4, speech5,speech51, speech6]
        for speech in speeches {
            if speech == speech2 {
                let newPlayerposition = CGPoint(x: kiko.position.x - (napoli.position.x - sanFrancisco.position.x), y: kiko.position.y - (napoli.position.y - sanFrancisco.position.y))
                kiko.run(SKAction.move(to: newPlayerposition, duration: 2.5))
            } else if speech == speech21{
                let newPlayerposition = CGPoint(x: kiko.position.x - (sanFrancisco.position.x - paris.position.x), y: kiko.position.y - (sanFrancisco.position.y - paris.position.y))
                kiko.run(SKAction.move(to: newPlayerposition, duration: 2.5))
            } else if speech == speech4 {
                let newPlayerposition = CGPoint(x: kiko.position.x - (paris.position.x - canada.position.x), y: kiko.position.y - (paris.position.y - canada.position.y))
                kiko.run(SKAction.move(to: newPlayerposition, duration: 2.5))
            }
            textLabel.text = ""
            for i in speech {
                textLabel.removeFromParent()
                textLabel.text! += "\(i)"
                addChild(textLabel)
                RunLoop.current.run(until: Date()+0.04)
            }
            RunLoop.current.run(until: Date()+1.0)
        }
    }
}
