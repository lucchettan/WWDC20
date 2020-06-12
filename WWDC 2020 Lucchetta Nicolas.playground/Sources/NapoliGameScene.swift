

import SpriteKit

public class NapoliGameScene: SKScene, SKPhysicsContactDelegate {
    
    
    // Constants we need 
    let numberOfChallenge = 12
    var score = 0
    let maxSpeed : UInt32 = 50
    var distanceLenght : CGFloat = 0.75
    var movingPlayer = false
    var playerOffset : CGPoint!
    var player : SKSpriteNode!
    var challenges = [SKSpriteNode]()
    let BitMaskChallengeCategory: UInt32 = 0x1 << 0
    let BitMaskPlayerCategory: UInt32 = 0x1 << 1
    var challengeOvercome : SKSpriteNode!
    var topLabel : SKLabelNode!
    var bottomLabel : SKLabelNode!
    
    // Function to add get positions randomly in the screen
    func positionWithin(range: CGFloat, containerSize: CGFloat) -> CGFloat {
        let a = CGFloat(arc4random_uniform(100)) / 100.0 
        let b = (containerSize * (1.0 - range) * 0.5)
        let c = (containerSize * range + b)
        return a * c
    }
    //get the distance between two positions
    func distanceFrom(positionA : CGPoint, positionB : CGPoint) ->CGFloat {
        let aSquared = (positionA.x - positionB.x) * (positionA.x - positionB.x)
        let bSquared = (positionA.y - positionB.y) * (positionA.y - positionB.y)
        return sqrt(aSquared + bSquared)
    }
    
    public override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody?.friction = 0.0
        physicsWorld.contactDelegate = self

        // Here We are going to set the Background
        let bg = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "NapoliBG.png")))
        bg.setScale(0.35)
        bg.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(bg)
        
        // Player 
        player = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "faceKiko.png")), color: .clear, size: CGSize(width: size.width * 0.15, height: size.height * 0.15))
        player.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(player)
        player.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width / 3)
        player.physicsBody?.isDynamic = false
        player.physicsBody?.categoryBitMask = BitMaskPlayerCategory
        player.physicsBody?.contactTestBitMask = BitMaskChallengeCategory
        
        
        
        
        // Challenges
        for _ in 1 ... 3 {
            createChallenge(texture: SKTexture(image: #imageLiteral(resourceName: "transportation.png")))
            createChallenge(texture: SKTexture(image: #imageLiteral(resourceName: "logos.png")))
            createChallenge(texture: SKTexture(image: #imageLiteral(resourceName: "seo-and-web.png")))
            createChallenge(texture: SKTexture(image: #imageLiteral(resourceName: "flags.png")))
        }
        for challenge in challenges {
            challenge.physicsBody?.applyImpulse(CGVector(dx: CGFloat(arc4random_uniform(maxSpeed)) - (CGFloat(maxSpeed) * 0.5), dy: CGFloat(arc4random_uniform(maxSpeed)) - (CGFloat(maxSpeed) * 0.5)))
        }
    }
    
    
    func createChallenge(texture: SKTexture) {
        let challenge = SKSpriteNode(texture: texture, color: .clear, size: CGSize(width: size.width * 0.05, height: size.height * 0.05))
        challenge.position = CGPoint(x: positionWithin(range: 0.8, containerSize: size.width), y: positionWithin(range: 0.8, containerSize: size.height))
        
        while distanceFrom(positionA: challenge.position, positionB: player.position) < challenge.size.width * distanceLenght * 5 {
            challenge.position = CGPoint(x: positionWithin(range: 1.0, containerSize: size.width * 0.8), y: positionWithin(range: 1.0, containerSize: size.height * 0.8))
        }
        
        addChild(challenge)
        challenges.append(challenge)
        
        challenge.physicsBody = SKPhysicsBody(circleOfRadius: challenge.size.width / 2)
        challenge.physicsBody?.affectedByGravity = false
        challenge.physicsBody?.categoryBitMask = BitMaskChallengeCategory
        // to add when it changes side challenge.physicsBody?.contactTestBitMask = BitMaskChallengeCategory
        challenge.physicsBody?.friction = 0.0
        challenge.physicsBody?.angularDamping = 0.0
        challenge.physicsBody?.restitution = 1.0
        challenge.physicsBody?.friction = 0.0
        challenge.physicsBody?.allowsRotation = false
        
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        let touchNodes = nodes(at: touchLocation)
        
        for node in touchNodes {
            if node == player {
                movingPlayer = true
                playerOffset = CGPoint(x: touchLocation.x - player.position.x, y: touchLocation.y - player.position.y)
            }
        }
        
    }
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard movingPlayer else { return }
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        let newPlayerposition = CGPoint(x: touchLocation.x - playerOffset.x, y: touchLocation.y - playerOffset.y)
        player.run(SKAction.move(to: newPlayerposition, duration: 0.01))
    }
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        movingPlayer = false
    }
    
    
    public func didBegin(_ contact: SKPhysicsContact) {
        let challengeDone: UInt32 = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if challengeDone == BitMaskPlayerCategory | BitMaskChallengeCategory {
            overcomeAChallenge(challengeAccomplished: contact.bodyB.node! as! SKSpriteNode)
            score += 1
            if score == numberOfChallenge {
                triggerVictory()
                perform(#selector(gotoScene), with: nil, afterDelay: 2.0)
            }
        }
    }
    
    func overcomeAChallenge(challengeAccomplished: SKSpriteNode) {
        // Challenge Accomplished Definition
        challengeAccomplished.texture = SKTexture(image: #imageLiteral(resourceName: "9770d4541e1b4a576acdfd790697b15f-sticker.png"))
        challengeAccomplished.size = CGSize(width: size.width * 0.15, height: size.height * 0.15)
        // challengeAccomplished.physicsBody = SKPhysicsBody(circleOfRadius: player.size.width / 3)
        challengeAccomplished.physicsBody?.categoryBitMask = BitMaskPlayerCategory
    }
    
    func triggerVictory() {
        player.texture = SKTexture(image: #imageLiteral(resourceName: "963c9b1ce47b453c02afb4e97b2acd92-sticker.png"))
        player.size = CGSize(width: size.width * 0.5, height: size.height * 0.5)
        topLabel = SKLabelNode(text: "Congrats we overcame all the challenges!!")
        bottomLabel = SKLabelNode(text: "What is going to be the next step?!")
        topLabel.fontSize = 40.0
        topLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        topLabel.fontColor = .white
        topLabel.fontName =  "Impact"
        bottomLabel.fontSize = 40
        bottomLabel.fontName =  "Impact"
        bottomLabel.position = CGPoint(x: topLabel.position.x, y: topLabel.position.y - 110)
        bottomLabel.fontColor = .white
        addChild(topLabel)
        addChild(bottomLabel)
    }
    
    @objc func gotoScene(){
        let scenetwo =  WorldSceneThree(size: UIScreen.main.bounds.size)
        scenetwo.scaleMode = .aspectFill
        view?.presentScene(scenetwo, transition: SKTransition.fade(withDuration: 0.5))
    }
}
