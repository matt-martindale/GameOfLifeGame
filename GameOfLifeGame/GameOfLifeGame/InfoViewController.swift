//
//  InfoViewController.swift
//  GameOfLifeGame
//
//  Created by Matthew Martindale on 10/22/20.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var exitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        exitButton.imageView?.contentMode = .scaleAspectFit
        exitButton.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
    }
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
