//
//  GameScene.swift
//  Project1
//
//  Created by Ritchie Andrews on 2/26/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // Player is created here so it can be used throughout the game
    
    let player = SKSpriteNode(imageNamed: "player-rocket.png")
    
    
    override func didMove(to view: SKView) {
        
        // This method is called when your game scene is ready to run
        // It loads background picture and sets its position at the back
        
        let background = SKSpriteNode(imageNamed: "space.jpg")
        background.zPosition = -1
        addChild(background)
        
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
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // this method is called when the user stops touching the screen
    }

    override func update(_ currentTime: TimeInterval) {
        // this method is called before each frame is rendered
    }
}
