//
//  ViewController.swift
//  SoundShaker
//
//  Created by IMCS2 on 2/23/19.
//  Copyright © 2019 IMCS2. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var songNum:Int = 0
    func playAction(_ sender: Any?){
        player.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipped(gestureRecognizer:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipped(gestureRecognizer:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
//        let audioPath = Bundle.main.path(forResource: "1", ofType: "mp3")
//        do{
//            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
//        }catch{
//            print("Error in the song play")
//        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake{
            let number = Int.random(in: 1 ... 17)
            songNum = number
            playShuffel(i: number)
        }
    }
    
    @objc func swipped(gestureRecognizer: UISwipeGestureRecognizer){
        if let swipeGesture = gestureRecognizer as? UISwipeGestureRecognizer{
            if swipeGesture.direction == UISwipeGestureRecognizer.Direction.right{
                rewind()
            }
            else{
                forward()
            }
        }
    }
    
    func playShuffel(i: Int){
        print("In shuffel", i)
        let audioPath = Bundle.main.path(forResource: String(i), ofType: "mp3")
        do{
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            player.play()
        }catch{
            print("Error in the song play")
        }
    }
    
    func rewind(){
        print("In rewind")
        let caseVariable = songNum
        if songNum != 1{
            songNum -= 1
        }
        else if songNum != 0{
            songNum = 17
        }
        switch caseVariable{
            case 1:
                playShuffel(i: 17)
            case 2:
                playShuffel(i: 1)
            case 3:
                playShuffel(i: 2)
            case 4:
                playShuffel(i: 3)
            case 5:
                playShuffel(i: 4)
            case 6:
                playShuffel(i: 5)
            case 7:
                playShuffel(i: 6)
            case 8:
                playShuffel(i: 7)
            case 9:
                playShuffel(i: 8)
            case 10:
                playShuffel(i: 9)
            case 11:
                playShuffel(i: 10)
            case 12:
                playShuffel(i: 11)
            case 13:
                playShuffel(i: 12)
            case 14:
                playShuffel(i: 13)
            case 15:
                playShuffel(i: 14)
            case 16:
                playShuffel(i: 15)
            case 17:
                playShuffel(i: 16)
        default:
            print("I am in switch at default case")
        }
        
//        player.play()
    }
    
    func forward(){
        print("In forward")
        let caseVariable = songNum
        if songNum != 17{
            songNum += 1
        }
        else if songNum != 0{
            songNum = 1
        }
        switch caseVariable{
        case 1:
            playShuffel(i: 2)
        case 2:
            playShuffel(i: 3)
        case 3:
            playShuffel(i: 4)
        case 4:
            playShuffel(i: 5)
        case 5:
            playShuffel(i: 6)
        case 6:
            playShuffel(i: 7)
        case 7:
            playShuffel(i: 8)
        case 8:
            playShuffel(i: 9)
        case 9:
            playShuffel(i: 10)
        case 10:
            playShuffel(i: 11)
        case 11:
            playShuffel(i: 12)
        case 12:
            playShuffel(i: 13)
        case 13:
            playShuffel(i: 14)
        case 14:
            playShuffel(i: 15)
        case 15:
            playShuffel(i: 16)
        case 16:
            playShuffel(i: 17)
        case 17:
            playShuffel(i: 1)
        default:
            print("I am in switch at default case")
        }
    }

}

