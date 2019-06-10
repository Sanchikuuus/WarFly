//
//  Cloud.swift
//  WarFly
//
//  Created by Sashko Shel on 6/9/19.
//  Copyright © 2019 Sashko Shel. All rights reserved.
//

import SpriteKit
import GameplayKit



final class Cloud: SKSpriteNode, GameBackgroundSpriteable {
    
    static func populate() -> Cloud {
        let cloudImageName = configName()
        let cloud = Cloud(imageNamed: cloudImageName)
        cloud.setScale(randomScaleFactor)
        cloud.position = randomPoint()
        cloud.zPosition = 10
        cloud.run(move(from: cloud.position))
        return cloud
    }
    
    static func populate(at point: CGPoint) -> Cloud {
        let cloudImageName = configName()
        let cloud = Cloud(imageNamed: cloudImageName)
        cloud.setScale(randomScaleFactor)
        cloud.position = point
        cloud.zPosition = 10
        cloud.run(move(from: cloud.position))
        return cloud
    }
    
    fileprivate static func configName() -> String {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 3)
        return "cl\(distribution.nextInt())"
    }
    
    fileprivate static var randomScaleFactor: CGFloat {
        let distribution = GKRandomDistribution(lowestValue: 20, highestValue: 30)
        return CGFloat(distribution.nextInt()) / 10
    }
    
    fileprivate static func move(from point: CGPoint) -> SKAction {
        let movePoint = CGPoint(x: point.x, y: -200)
        let moveDistance = point.y + 200
        let moveSpeed = 150.0
        let duration = moveDistance / CGFloat(moveSpeed)
        return SKAction.move(to: movePoint, duration: TimeInterval(duration))
    }

}
