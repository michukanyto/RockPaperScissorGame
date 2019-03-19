//
//  ViewController.swift
//  RockPaperScissor
//
//  Created by Marlon Escobar on 2019-03-13.
//  Copyright © 2019 Marlon Escobar A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imageGame:[UIImage] = [UIImage(named: "paper.png")!,
                               UIImage(named: "rock.png")!,
                               UIImage(named: "scissor.png")!
    ]

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var machineImageView: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func rockButtonPressed(_ sender: UIButton) {
        userImageView.image = imageGame[1]
    }
    
    
    @IBAction func paperButonPressed(_ sender: UIButton) {
        userImageView.image = imageGame[0]
    }
    
    
    @IBAction func scissorButtonPressed(_ sender: UIButton) {
        userImageView.image = imageGame[2]
    }
    
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        machineImageView.image = imageGame[Int.random(in: 0...2)]
        
    }
}

