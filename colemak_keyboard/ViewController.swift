//
//  ViewController.swift
//  colemak_keyboard
//
//  Created by karthick mohanasundaram on 05/03/2017.
//  Copyright © 2017 karthick mohanasundaram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var textEntered: String = ""
    private var inputmode = false

    @IBOutlet weak var inputText: UILabel!
    
    @IBOutlet weak var alphabets_btn: UIButton!
  
    @IBOutlet weak var arrayText: UILabel!
    public static var counter = 0
    public static var error_Counter = 0
    
    let words_array = ["COMPUTER","UNIVERSITY","COFFEE", "STEWARDESSES", "PAZAZZES","KRZYWINSKI","OBSTINANCE","CHIAROSCURIST","QUETZALCOATL","FRAEXPIALDOCIOUS","HNOIEWGBUQW","FLOCCINAUCINIHI","RAGINYLLEUC"]
    var entered_array = [String]()
    public static var entered_Words:String = ""
     public static var given_Words:String = ""
    
    @IBOutlet weak var entered_Label: UILabel!
    @IBOutlet weak var given: UILabel!
    var timer = Timer()
    var seconds = 100
    
    @IBOutlet weak var results_view: UIView!
    @IBOutlet weak var timer_label: UILabel!
    @IBOutlet weak var error_label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        results_view.isHidden = true
        arrayText.text=words_array[0]
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        
        for words in words_array {
            
            ViewController.given_Words += (words + "\n")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   func updateTimer()
   {
    seconds -= 1
    timer_label.text = "\(seconds)"
    if seconds <= 0
    {
        timer_label.text = "0"
        inputText.text = "🤡 end of test 🤡"
        arrayText.text = "-"
        results_view.isHidden = false
        
        
        given.text = ViewController.given_Words
        entered_Label.text = ViewController.entered_Words
        error_label.text = "\(ViewController.error_Counter)"
    }
    
    
    }

   @IBAction func button_clicked(_ sender: UIButton) {
    
        let textEntered = sender.currentTitle!
    if inputmode{
        inputText.text = inputText.text! + textEntered
    }else{
        inputText.text = textEntered
        inputmode = true
    }
    
    }
    
    @IBAction func backspace_Pressed(_ sender: UIButton) {
        ViewController.error_Counter += 1
        
        
       textEntered = inputText.text!
       //let result = textEntered.characters.dropLast() as? String
     textEntered.remove(at: textEntered.index(before: textEntered.endIndex))
        
        inputText.text=textEntered
    }
    
    @IBAction func enter_Pressed(_ sender: UIButton) {
        let result=inputText.text! + "\n"
       ViewController.entered_Words += result
        ViewController.counter += 1
        if ViewController.counter < words_array.count
        {
        textEntered = inputText.text!
        inputText.text = " "
        arrayText.text=words_array[ViewController.counter]
        
        
            entered_array.append(inputText.text!)
        }
        else{
            inputText.text="🤡 end of test 🤡"
        }
        
    }
    
}




