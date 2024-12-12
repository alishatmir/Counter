//
//  ViewController.swift
//  Counter
//
//  Created by Алина Тихомирова on 12.12.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var historyBoxView: UIView!
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var counterBoxView: UIView!
    @IBOutlet weak var counterLabel: UILabel!

    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    private var counterValue = 0 {
        didSet {
            counterLabel.text = "\(counterValue)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minusButton.imageView?.contentMode = .scaleToFill
        
        historyBoxView.layer.cornerRadius = 16
        counterBoxView.layer.cornerRadius = 16
        
        repeatButton.backgroundColor = .clear
        plusButton.backgroundColor = .clear
        minusButton.backgroundColor = .clear
        
        counterValue = 0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onMinusTap(_ sender: Any) {
        if counterValue > 0 {
            counterValue -= 1
        } else {
            print("значение счётчика не должно падать ниже нуля")
        }
    }
    
    @IBAction func onPlusTap(_ sender: Any) {
        counterValue += 1
    }
    
    @IBAction func onRepeatTap(_ sender: Any) {
        counterValue = 0
    }
}

