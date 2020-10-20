//
//  Creature.swift
//  GameOfLifeGame
//
//  Created by Matthew Martindale on 10/19/20.
//

import SpriteKit

class Creature: SKSpriteNode {

    var isAlive: Bool = false {
        didSet {
            isHidden = !isAlive
        }
    }

    var neighborCount = 0

    init() {
        let texture = SKTexture(imageNamed: "bubble")
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        zPosition = 1
        anchorPoint = CGPoint(x: 0, y: 0)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
