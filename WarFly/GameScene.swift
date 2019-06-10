//
//  GameScene.swift
//  WarFly
//
//  Created by Sashko Shel on 6/9/19.
//  Copyright © 2019 Sashko Shel. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {

    let motionManager = CMMotionManager()
    var xAcceleration: CGFloat = 0
    var player: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        configStartScene()
        spawnClouds()
        spawnIslands()
    }
    
    fileprivate func spawnClouds() {
        let spawnCloudWait = SKAction.wait(forDuration: 1.5)
        let spawnCloudAction = SKAction.run {
            let cloud = Cloud.populate()
            self.addChild(cloud)
        }
        let spawnCloudSequence = SKAction.sequence([spawnCloudWait, spawnCloudAction])
        let spawnCloudForewer = SKAction.repeatForever(spawnCloudSequence)
        run(spawnCloudForewer)
    }
    
    fileprivate func spawnIslands() {
        let spawnIslandWait = SKAction.wait(forDuration: 1.5)
        let spawnIslandAction = SKAction.run {
            let island = Island.populate()
            self.addChild(island)
        }
        let spawnIslandSequence = SKAction.sequence([spawnIslandWait, spawnIslandAction])
        let spawnIslandForewer = SKAction.repeatForever(spawnIslandSequence)
        run(spawnIslandForewer)
    }
    
    override func didSimulatePhysics() {
        super.didSimulatePhysics()
        player.position.x += xAcceleration * 50
        if player.position.x < -70 {
            player.position.x = self.size.width + 70
        } else if player.position.x > self.size.width + 70 {
            player.position.x = -70
        }
    
    }
    
    fileprivate func configStartScene() {
        
        let screenCenterPoint = CGPoint(x: self.size.width/2, y: self.size.height/2)
        let background = Background.populateBackground(at: screenCenterPoint)
        background.size = self.size
        self.addChild(background)
        
        let screen = UIScreen.main.bounds

        let island1 = Island.populate(at: CGPoint(x: 100, y: 200))
        self.addChild(island1)
        
        let island2 = Island.populate(at: CGPoint(x: self.size.width-100, y: self.size.height - 200))
        self.addChild(island2)
        
//        let cloud = Cloud.populate()
//        self.addChild(cloud)
        
        player = PlayerPlane.populate(at: CGPoint(x: screen.size.width/2, y: 100))
        self.addChild(player)
        
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data, error) in
            if let data = data {
                let acceleration = data.acceleration
                self.xAcceleration = CGFloat(acceleration.x * 0.7) + self.xAcceleration * 0.3
            }
        }
    }
}
