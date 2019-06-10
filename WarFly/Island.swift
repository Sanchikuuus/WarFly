//
//  Island.swift
//  WarFly
//
//  Created by Sashko Shel on 6/9/19.
//  Copyright © 2019 Sashko Shel. All rights reserved.
//

import SpriteKit
import GameplayKit

final class Island: SKSpriteNode, GameBackgroundSpriteable {
    
    static func populate() -> Island {
        let islandImageName = configName()
        let island = Island(imageNamed: islandImageName)
        island.setScale(randomScaleFactor)
        island.position = randomPoint()
        island.zPosition = 1
        island.run(rotateForRandomAngel())
        island.run(move(from: island.position))
        return island
    }
    
    static func populate(at point: CGPoint) -> Island {
        let islandImageName = configName()
        let island = Island(imageNamed: islandImageName)
        island.setScale(randomScaleFactor)
        island.position = point
        island.zPosition = 1
        island.run(rotateForRandomAngel())
        island.run(move(from: island.position))
        return island
    }
    
    fileprivate static func configName() -> String {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 4)
        return "is\(distribution.nextInt())"
    }
    
    fileprivate static var randomScaleFactor: CGFloat {
        let distribution = GKRandomDistribution(lowestValue: 1, highestValue: 10)
        return CGFloat(distribution.nextInt()) / 10
    }
    
    fileprivate static func rotateForRandomAngel() -> SKAction {
        let distribution = GKRandomDistribution(lowestValue: 0, highestValue: 360)
        let randomNumber = CGFloat(distribution.nextInt())
        return SKAction.rotate(toAngle: randomNumber * CGFloat(Double.pi / 180), duration: 0)
    }
    
    fileprivate static func move(from point: CGPoint) -> SKAction {
        let movePoint = CGPoint(x: point.x, y: -200)
        let moveDistance = point.y + 200
        let moveSpeed = 100.0
        let duration = moveDistance / CGFloat(moveSpeed)
        return SKAction.move(to: movePoint, duration: TimeInterval(duration))
    }
}
