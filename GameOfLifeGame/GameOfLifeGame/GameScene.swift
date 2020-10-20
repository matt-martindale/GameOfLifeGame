//
//  GameScene.swift
//  GameOfLifeGame
//
//  Created by Matthew Martindale on 10/19/20.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var gridNode: Grid!
    
    var stepButton: MSButtonNode!
    var populationLabel: SKLabelNode!
    var generationLabel: SKLabelNode!
    var playButton: MSButtonNode!
    var pauseButton: MSButtonNode!

    override func didMove(to view: SKView) {
        gridNode = childNode(withName: "gridNode") as? Grid
        
        stepButton = childNode(withName: "stepButton") as? MSButtonNode
        populationLabel = childNode(withName: "populationLabel") as? SKLabelNode
        generationLabel = childNode(withName: "generationLabel") as? SKLabelNode
        playButton = childNode(withName: "playButton") as? MSButtonNode
        pauseButton = childNode(withName: "pauseButton") as? MSButtonNode
        
        stepButton.selectedHandler = {
            self.stepSimulation()
        }
        
        let delay = SKAction.wait(forDuration: 0.5)
        let callMethod = SKAction.perform(#selector(stepSimulation), onTarget: self)
        let stepSequence = SKAction.sequence([delay,callMethod])
        let simulation = SKAction.repeatForever(stepSequence)
        self.run(simulation)
        self.isPaused = true
        
        playButton.selectedHandler = { [weak self] in
            self?.isPaused = false
        }
        
        pauseButton.selectedHandler = { [weak self] in
            self?.isPaused = true
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
    }

    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
    
    @objc func stepSimulation() {
      gridNode.evolve()

      populationLabel.text = String(gridNode.population)
      generationLabel.text = String(gridNode.generation)
    }
}
