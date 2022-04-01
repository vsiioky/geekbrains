//
//  GameScene.swift
//  Shake8
//
//  Created by Владислав Калабанов on 30.03.2022.
//

import SpriteKit
import GameplayKit

struct CollisionCategories {
    static let Snake: UInt32 = 0x1 << 0
    static let SnakeHead: UInt32 = 0x1 << 1
    static let Apple: UInt32 = 0x1 << 2
    static let EdgeBody: UInt32 = 0x1 << 3
}

class GameScene: SKScene {
    var snake: Snake?
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.black
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.physicsBody?.allowsRotation = false
        view.showsPhysics = true
        
        let counterClockwiseButton = SKShapeNode()
        counterClockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        counterClockwiseButton.position = CGPoint(x: view.scene!.frame.minX + 30, y: view.scene!.frame.minY + 30)
        counterClockwiseButton.fillColor = UIColor.gray
        counterClockwiseButton.strokeColor = UIColor.gray
        counterClockwiseButton.lineWidth = 10
        counterClockwiseButton.name = "counterClockwiseButton"
        self.addChild(counterClockwiseButton)
        
        let clockwisebutton = SKShapeNode()
        clockwisebutton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        clockwisebutton.position = CGPoint(x: view.scene!.frame.maxX - 75, y: view.scene!.frame.minY + 30)
        clockwisebutton.fillColor = UIColor.gray
        clockwisebutton.strokeColor = UIColor.gray
        clockwisebutton.lineWidth = 10
        clockwisebutton.name = "ClockwiseButton"
        self.addChild(clockwisebutton)
        
        createApple()
        snake = Snake (atPoint: CGPoint(x: view.scene!.frame.midX, y: view.scene!.frame.midY))
        self.addChild(snake!)
        
        self.physicsWorld.contactDelegate = self
        
        self.physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        self.physicsBody?.contactTestBitMask = CollisionCategories.Snake | CollisionCategories.SnakeHead
    }
                                            
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode, touchNode.name == "counterClockwiseButton" || touchNode.name == "ClockwiseButton" else {
                    return
        }
            touchNode.fillColor = .green
            touchNode.strokeColor = .black
            
            if touchNode.name == "counterClockwiseButton"{
                snake!.moveCounterClockwise()
            }else if touchNode.name == "ClockwiseButton"{
                snake!.moveClockwise()

            }
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
             
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode, touchNode.name == "counterClockwiseButton" || touchNode.name == "ClockwiseButton" else{
                    return
        }
            touchNode.fillColor = .gray
            touchNode.strokeColor = .gray

    }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered

        snake!.move()
    }


func createApple() {
    let randX = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX - 10)))
    let randY = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY - 10)))
    let apple = Apple(position: CGPoint(x: randX, y: randY))
    self.addChild(apple)
}
}

extension GameScene: SKPhysicsContactDelegate {
    
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyes = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        let collisionObject = bodyes - CollisionCategories.SnakeHead
        
        switch collisionObject {
            
        case CollisionCategories.Apple:
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
            snake?.addBodypart()
            apple?.removeFromParent()
            createApple()
            print("1")
            
        case CollisionCategories.EdgeBody:
            self.removeAllChildren()
            didMove(to: view!)
            
            
    default:
        break
    }
}
}
