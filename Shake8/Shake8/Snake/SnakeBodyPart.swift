//
//  SnakeBodyPart.swift
//  Shake8
//
//  Created by Владислав Калабанов on 30.03.2022.
//

import UIKit
import SpriteKit

class SnakeBodyPart: SKShapeNode {
    
    let diametr = 10.0
    
    init (atPoint point: CGPoint){
        super.init()
        
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: diametr, height: diametr)).cgPath
        fillColor = UIColor.green
        strokeColor = UIColor.green
        lineWidth = 5
        
        self.position = point
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: diametr, center: CGPoint(x: 0, y: 0))
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = CollisionCategories.Snake
        self.physicsBody?.contactTestBitMask = CollisionCategories.EdgeBody | CollisionCategories.Apple
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
