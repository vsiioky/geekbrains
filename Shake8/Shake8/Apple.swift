//
//  Apple.swift
//  Shake8
//
//  Created by Владислав Калабанов on 30.03.2022.
//

import UIKit
import SpriteKit

class Apple: SKShapeNode {
    
    init(position: CGPoint) {
        super.init()
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 10, height: 10)).cgPath
        fillColor = .red
        strokeColor = .red
        lineWidth = 5
        self.position = position
        self.physicsBody = SKPhysicsBody(circleOfRadius: 10.0, center: CGPoint(x: 0, y: 0))
        self.physicsBody?.categoryBitMask = CollisionCategories.Apple
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
