//
//  Background.swift
//  WarFly
//
//  Created by Sashko Shel on 6/9/19.
//  Copyright © 2019 Sashko Shel. All rights reserved.
//

import SpriteKit

class Background: SKSpriteNode {

    static func populateBackground(at point: CGPoint ) -> Background {
        let background = Background(imageNamed: "background")
        background.position = point //аргумент конструктора
        background.zPosition = 0
        return background
    }
}
