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
    var clearButton: MSButtonNode!
    var infoButton: MSButtonNode!
    var blinkerButton: MSButtonNode!
    var gliderButton: MSButtonNode!
    var bloomerButton: MSButtonNode!

    override func didMove(to view: SKView) {
        
        gridNode = childNode(withName: "gridNode") as? Grid
        
        stepButton = childNode(withName: "stepButton") as? MSButtonNode
        populationLabel = childNode(withName: "populationLabel") as? SKLabelNode
        generationLabel = childNode(withName: "generationLabel") as? SKLabelNode
        playButton = childNode(withName: "playButton") as? MSButtonNode
        pauseButton = childNode(withName: "pauseButton") as? MSButtonNode
        clearButton = childNode(withName: "clearButton") as? MSButtonNode
        infoButton = childNode(withName: "infoButton") as? MSButtonNode
        blinkerButton = childNode(withName: "blinkerButton") as? MSButtonNode
        gliderButton = childNode(withName: "gliderButton") as? MSButtonNode
        bloomerButton = childNode(withName: "bloomerButton") as? MSButtonNode
        
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
        
        clearButton.selectedHandler = {
            [weak self] in
            guard let self = self else { return }
            self.gridNode.clearGrid()
            self.updateStats()
        }
        
        infoButton.selectedHandler = { [weak self] in
            guard let self = self else { return }
            self.presentInfoVC()
        }
        
        blinkerButton.selectedHandler = { [weak self] in
            guard let self = self else { return }
            self.gridNode.blinker()
        }
        
        gliderButton.selectedHandler = { [weak self] in
            guard let self = self else { return }
            self.gridNode.glider()
        }
        
        bloomerButton.selectedHandler = { [weak self] in
            guard let self = self else { return }
            self.gridNode.bloomer()
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

      updateStats()
    }
    
    private func updateStats() {
        populationLabel.text = String(gridNode.population)
        generationLabel.text = String(gridNode.generation)
    }
    
    private func presentInfoVC() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "infoVC") as! InfoViewController
        self.view?.window?.rootViewController?.present(vc, animated: true, completion: nil)
    }
    
}
