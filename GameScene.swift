//
//  GameScene.swift
//  HelloSpriteKit
//
//  Created by Jihun Kang on 2023/12/12.
//

import SpriteKit

class GameScene:SKScene {
    let label = SKLabelNode(text: "Hello Coding Campus!")

    override func didMove(to view: SKView) {
        label.fontSize = 30
        label.fontColor = SKColor.magenta
        label.fontName = "GillSans-Bold"
        label.position = CGPoint(x:view.frame.width / 2, y:view.frame.height / 2)
        addChild(label)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        view.addGestureRecognizer(recognizer)
    }
    
    @objc func didTapView(recognizer: UIGestureRecognizer) {
        let viewLocation = recognizer.location(in: view)
        let sceneLocation = convertPoint(fromView: viewLocation)
        let moveByAction = SKAction.moveBy(x: sceneLocation.x - label.position.x, y: sceneLocation.y - label.position.y, duration: 1)
        
        let moveByReversedAction = moveByAction.reversed()
        let moveByActions = [moveByAction, moveByReversedAction]
        let moveSequence = SKAction.sequence(moveByActions)
        label.run(moveSequence)
        
        
    }
    


}

