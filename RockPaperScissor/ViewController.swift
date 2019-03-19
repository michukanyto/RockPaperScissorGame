//
//  ViewController.swift
//  RockPaperScissor
//
//  Created by Marlon Escobar on 2019-03-13.
//  Copyright © 2019 Marlon Escobar A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    var time = 2.5
    var machinePoints = 0
    var userPoints = 0
    var machineIndex:Int = 0
    var userIndex:Int = 0
    var winText:String = "USER WIN!"
    
    var imageGame:[UIImage] = [UIImage(named: "rock.png")!,
                               UIImage(named: "paper.png")!,
                               UIImage(named: "scissor.png")!
    ]

    @IBOutlet weak var userPointsTextView: UITextField!
    
    @IBOutlet weak var machinePointsTextView: UITextField!
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var machineImageView: UIImageView!
   
    @IBOutlet weak var resultTextView: UITextField!
    
    @IBOutlet weak var playButtonPressed: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playButtonPressed.isHidden = true
        resultTextView.isHidden = true
    }


    @IBAction func rockButtonPressed(_ sender: UIButton) {
        userIndex = 1
        userImageView.image = imageGame[userIndex]
        playButtonPressed.isHidden = false
    }
    
    
    @IBAction func paperButonPressed(_ sender: UIButton) {
        userIndex = 0
        userImageView.image = imageGame[userIndex]
        playButtonPressed.isHidden = false
    }
    
    
    @IBAction func scissorButtonPressed(_ sender: UIButton) {
        userIndex = 2
        userImageView.image = imageGame[userIndex]
        playButtonPressed.isHidden = false
    }
    
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
        playButtonPressed.isHidden = true
        resultTextView.isHidden = true
        
        
    }
    
    @objc func action(){
        time -= 0.5
        machineIndex = Int.random(in: 0...2)
        machineImageView.image = imageGame[machineIndex]
        if (time == 0){
            timer.invalidate()
            time = 2.5
            playButtonPressed.isHidden = false
            checkWinner()
        }
        
    }
    
    func checkWinner(){
//        if(machineIndex == userIndex){
//            print("It's a TIE")
//            resultTextView.text = "It's a TIE"
//        }else if(machineIndex > userIndex){
//            if(userIndex != 0){
//                machineIndex += 1
//                print("\(machineIndex)")
//                resultTextView.text = "Machine Win"
//            }else{
//                userIndex += 1
//                print("\(machineIndex)")
//                resultTextView.text = "User Win"
//            }
//
//
//        }else{
//            userPoints += 1
//            print("\(userIndex)")
//            resultTextView.text = "User Win"
//        }
        if(machineIndex == userIndex){
            winText = "IT'S A TIE!"
        }else{
            switch machineIndex {
            case 0:
                if(userIndex == 2){
                    machinePoints += 1
                    winText = "MACHINE WIN!"
                }else{
                    userPoints += 1
                }
            case 1:
                if(userIndex == 0){
                    machinePoints += 1
                    winText = "MACHINE WIN!"
                }else{
                    userPoints += 1
                }
            case 2:
                if(userIndex == 1){
                    machinePoints += 1
                    winText = "MACHINE WIN!"
                }else{
                    userPoints += 1
                }
            default:
                break
            }
        }
        machinePointsTextView.text = "\(machinePoints)"
        userPointsTextView.text = "\(userPoints)"
        resultTextView.text = winText
        winText = "USER WIN!"
        resultTextView.isHidden = false
        
    }
}

