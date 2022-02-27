//
//  GameScene.swift
//  Project1
//
//  Created by Ritchie Andrews on 2/26/22.
//

import SpriteKit
import GameplayKit

@objcMembers

class GameScene: SKScene {
    
    // Player is created here so it can be used throughout the game
    
    let player = SKSpriteNode(imageNamed: "player-rocket.png")
    var touchingPlayer = false
    
    var gameTimer: Timer?
    
    
    override func didMove(to view: SKView) {
        
        // This method is called when your game scene is ready to run
        // It loads background picture and sets its position at the back
        
        let background = SKSpriteNode(imageNamed: "space.jpg")
        background.zPosition = -1
        addChild(background)
        
        // starts timer for enemy creation
        
        gameTimer = Timer.scheduledTimer(timeInterval: 0.35, target: self, selector: #selector(createEnemy), userInfo: nil, repeats: true)
        
        
        // We modify the snow particles to create space dust and move time ahead to fill screen at game start
        
        if let particles = SKEmitterNode(fileNamed: "SpaceDust") {
            particles.advanceSimulationTime(10)
            particles.position.x = 512
            addChild(particles)
        }
        
        // This displays the player and sets its position to the left side of the screen
        
        player.position.x = -400
        player.zPosition = 1
        addChild(player)
        
     
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // this method is called when the user touches the screen
        // check to see if location contains the player if it does make touchingPlayer true
        
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let tappedNodes = nodes(at: location)
        
        if tappedNodes.contains(player) {
            touchingPlayer = true
            
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // if player is being touched move to new location
        
        guard touchingPlayer else { return }
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        player.position = location
        
        
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // this method is called when the user stops touching the screen and sets touchingPlayer to false
        
        touchingPlayer = false
    }

    override func update(_ currentTime: TimeInterval) {
        
        // this method is called before each frame is rendered
    }
    
   
    
    func createEnemy() {
            
            // Code goes here
        
       
        let randomDistribution = GKRandomDistribution(lowestValue: -350, highestValue: 350)
        let sprite = SKSpriteNode(imageNamed: "asteroid")
        
        
            
            sprite.position = CGPoint(x: 500, y: randomDistribution.nextInt())
            sprite.name = "enemy"
            sprite.zPosition = 1
            addChild(sprite)
            
            sprite.physicsBody = SKPhysicsBody(texture: sprite.texture!, size: sprite.size)
            sprite.physicsBody?.velocity = CGVector(dx: -500, dy: 0)
            sprite.physicsBody?.linearDamping = 0.0
            
        }
    }

