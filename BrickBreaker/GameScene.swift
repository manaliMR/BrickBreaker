//
//  GameScene.swift
//  BrickBreaker
//
//  Created by Manali Rami on 2018-09-19.
//  Copyright © 2018 Manali Rami. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var ball: SKSpriteNode!
    var paddle: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        ball = self.childNode(withName: "Ball") as! SKSpriteNode
        paddle = self.childNode(withName: "Paddle") as! SKSpriteNode
        ball.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 50))
        let border = SKPhysicsBody(edgeLoopFrom: (view.scene?.frame)!)
        border.friction = 0
        self.physicsBody = border
        self.physicsWorld.contactDelegate = self
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let firstObject = contact.bodyA.node?.name
        let secondObject = contact.bodyB.node?.name
        
        if firstObject == "Ball" && secondObject == "Brick" {
            contact.bodyB.node?.removeFromParent()
        }
    }
}
