//
//  GameBackgroundSpriteable + Extension.swift
//  WarFly
//
//  Created by Sashko Shel on 6/9/19.
//  Copyright © 2019 Sashko Shel. All rights reserved.
//

import SpriteKit
import GameplayKit

protocol GameBackgroundSpriteable {
    static func populate() -> Self
    static func randomPoint() -> CGPoint
}

extension GameBackgroundSpriteable {
    static func randomPoint() -> CGPoint {
        let screen = UIScreen.main.bounds.size
        let distribution = GKRandomDistribution(lowestValue: Int(screen.height + 100), highestValue: Int(screen.height + 200))
        let y: CGFloat = CGFloat(distribution.nextInt())
        let x = CGFloat(GKRandomSource.sharedRandom().nextInt(upperBound: Int(screen.width)))
        return CGPoint(x: x, y: y)
    }
}
