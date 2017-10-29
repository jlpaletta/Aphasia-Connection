//
//  QuizView.swift
//  phas
//
//  Created by Lucca Paletta on 10/28/17.
//  Copyright © 2017 jolupa. All rights reserved.
//

import UIKit


let User = UserDefaults.standard.string(forKey: "name")!
let easyCorrect = UserDefaults.standard.integer(forKey: "easyCorrect")
let hardCorrect = UserDefaults.standard.integer(forKey: "hardCorrect")
let easyTotal = UserDefaults.standard.integer(forKey: "easyTotal")
let hardTotal = UserDefaults.standard.integer(forKey: "hardTotal")

class QuizView: UIViewController {
    
    var correct: Int?
    var iseasy = true
    
    @IBOutlet weak var topPic: UIImageView!
    
    @IBOutlet weak var B1o: UIButton!
    @IBOutlet weak var B2o: UIButton!
    @IBOutlet weak var B3o: UIButton!
    @IBOutlet weak var B4o: UIButton!
    
    
    func isRight(ButtonNumber: Int){
        if correct == ButtonNumber{
            //if the user gets the question correct, plays correct sound and animation
            print("GOT IT RIGHT")
            Sound(correct: true)
            rightAnimation(button: ButtonNumber)
            
            //increments the stored correct value
            if iseasy{
                let x = UserDefaults.standard.integer(forKey: "easyCorrect")
                UserDefaults.standard.set(x + 1, forKey: "easyCorrect")
                print(easyCorrect)
            }
            else{
                let x = UserDefaults.standard.integer(forKey: "hardCorrect")
                UserDefaults.standard.set(x+1, forKey: "hardCorrect")
            }
            
            //sets difficulty to hard
            iseasy = false
        }
        else{
            //if the user gets the question wrong, plays incorrect sound and animation
            Sound(correct: false)
            wrongAnimation(button: ButtonNumber)
            
            //sets difficulty to easy
            iseasy = true
        }
        //delay after answering question
        let when = DispatchTime.now() + 0.5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.newQuestion()
        }
    }
    
    
    
    @IBAction func B1(_ sender: Any) {
        isRight(ButtonNumber: 1)
    }
    
    @IBAction func B2(_ sender: Any) {
        isRight(ButtonNumber: 2)
    }
    
    @IBAction func B3(_ sender: Any) {
        isRight(ButtonNumber: 3)
    }
    
    @IBAction func B4(_ sender: Any) {
        isRight(ButtonNumber: 4)
    }
    
    //creates new question with appropriate difficulty, increments total attempts
    func newQuestion(){
        
        var Q : Question?
        if iseasy{
            Q = getEasyQuestion()
            let x = UserDefaults.standard.integer(forKey: "easyTotal")
            UserDefaults.standard.set(x+1, forKey: "easyTotal")
        }
        else{
            Q = getHardQuestion()
            let x = UserDefaults.standard.integer(forKey: "hardTotal")
            UserDefaults.standard.set(x+1, forKey: "hardTotal")
        }
        
        correct = Int (arc4random_uniform(3)) + 1
        fillButtons(Q: Q!, Correct: correct!)
        print("EC" + String(UserDefaults.standard.integer(forKey: "easyCorrect")))
        print("HC" + String(UserDefaults.standard.integer(forKey: "hardCorrect")))
        print("ET" + String(UserDefaults.standard.integer(forKey: "easyTotal")))
        print("HT" + String(UserDefaults.standard.integer(forKey: "hardTotal")))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newQuestion()
        
    }
    
    //assigns word choices to each button
    func fillButtons(Q : Question, Correct: Int){
        if Correct == 1{
            B1o.setTitle(Q.ansC, for: UIControlState.normal)
            B2o.setTitle(Q.ans1, for: UIControlState.normal)
            B3o.setTitle(Q.ans2, for: UIControlState.normal)
            B4o.setTitle(Q.ans3, for: UIControlState.normal)
            topPic.image = Q.image
        }
        if Correct == 2{
            B1o.setTitle(Q.ans1, for: UIControlState.normal)
            B2o.setTitle(Q.ansC, for: UIControlState.normal)
            B3o.setTitle(Q.ans2, for: UIControlState.normal)
            B4o.setTitle(Q.ans3, for: UIControlState.normal)
            topPic.image = Q.image
        }
        if Correct == 3{
            B1o.setTitle(Q.ans1, for: UIControlState.normal)
            B2o.setTitle(Q.ans2, for: UIControlState.normal)
            B3o.setTitle(Q.ansC, for: UIControlState.normal)
            B4o.setTitle(Q.ans3, for: UIControlState.normal)
            topPic.image = Q.image
        }
        if Correct == 4{
            B1o.setTitle(Q.ans1, for: UIControlState.normal)
            B2o.setTitle(Q.ans2, for: UIControlState.normal)
            B3o.setTitle(Q.ans3, for: UIControlState.normal)
            B4o.setTitle(Q.ansC, for: UIControlState.normal)
            topPic.image = Q.image
        }
    }
    
    //makes chosen button green
    func rightAnimation(button: Int){
        var uibutton : UIButton?
        if button == 1{
            uibutton = B1o
        }
        if button == 2{
            uibutton = B2o
        }
        if button == 3{
            uibutton = B3o
        }
        if button == 4{
            uibutton = B4o
        }
        
        
        uibutton!.setBackgroundImage(UIImage(named: "ButtonG"), for: UIControlState.normal)
        let when = DispatchTime.now() + 0.5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            uibutton!.setBackgroundImage(UIImage(named: "Button"), for: UIControlState.normal)
        }
    }
    
    //makes chosen button red
    func wrongAnimation(button: Int){
        var uibutton : UIButton?
        if button == 1{
            uibutton = B1o
        }
        if button == 2{
            uibutton = B2o
        }
        if button == 3{
            uibutton = B3o
        }
        if button == 4{
            uibutton = B4o
        }
        
        
        uibutton!.setBackgroundImage(UIImage(named: "ButtonR"), for: UIControlState.normal)
        let when = DispatchTime.now() + 0.5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            
            uibutton!.setBackgroundImage(UIImage(named: "Button"), for: UIControlState.normal)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
