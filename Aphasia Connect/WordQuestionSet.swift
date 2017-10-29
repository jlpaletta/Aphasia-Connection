//
//  WordQuestionSet.swift
//  phas
//
//  Created by Lucca Paletta on 10/28/17.
//  Copyright © 2017 jolupa. All rights reserved.
//

import Foundation
import AVFoundation

//Get Question Methods

func getEasyQuestion() -> Question{
    var num1 : Int
    var num2 : Int
    var num3 : Int
    
    let num = Int(arc4random_uniform(UInt32(correctEasy.count)))
    let numR = Int(arc4random_uniform(UInt32(ansEasy.count)))
    if numR > (ansEasy.count-4){
        num1 = numR-1
        num2 = numR-2
        num3 = numR-3
    }
    else{
        num1 = numR+1
        num2 = numR+2
        num3 = numR+3
    }
    
    return Question(makingthing: ansEasy[num1], answer2: ansEasy[num2], answer3: ansEasy[num3], answercorrect: correctEasy[num])
}



func getHardQuestion() ->Question{
    var num1 : Int
    var num2 : Int
    var num3 : Int
    
    let num = Int(arc4random_uniform(UInt32(correctHard.count)))
    let numR = Int(arc4random_uniform(UInt32(ansHard.count)))
    
    
    if numR > (ansHard.count-4){
        num1 = numR-1
        num2 = numR-2
        num3 = numR-3
    }
    else{
        num1 = numR+1
        num2 = numR+2
        num3 = numR+3
    }
    
    return Question(makingthing: ansHard[num1], answer2: ansHard[num2], answer3: ansHard[num3], answercorrect: correctHard[num])
}

//Levels

var correctEasy = ["Dog", "Elephant", "Cat", "Chair", "Cake", "Beetle", "TV", "Basketball"]

var ansEasy = ["Ladder", "Apple", "Computer", "Television", "Clothes", "Candy" ]



var correctHard = ["Dessert", "Furniture", "Animal", "Insect", "Instrument", "Clothes", "Plant", "Exercise"]

var ansHard = ["Computer", "Planes", "Buildings", "Cars", "Candy", "Tools", "Vegetable"]

//Sound

var player : AVAudioPlayer?

func Sound(correct: Bool){
    
    let audioPath1 = Bundle.main.path(forResource: "Ding.mp3", ofType: nil)
    let audioPath2 = Bundle.main.path(forResource: "Dong.mp3", ofType: nil)
    let url1 = URL(fileURLWithPath: audioPath1!)
    let url2 = URL(fileURLWithPath: audioPath2!)
    
    print(audioPath1)
    
    if correct{
        do{
            try player = AVAudioPlayer(contentsOf: url1)
        }
        catch{
            print("error")
        }
    }
    
    else{
        do{
            //player.volume = 1.0
            try player = AVAudioPlayer(contentsOf: url2)
        }
        catch{
            print("error")
        }
    }
    player!.play()
}
