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
    
    let dateFormatter = DateFormatter()
    
    private var historyText = "История изменений:" {
        didSet {
            historyTextView.text = historyText
        }
    }
    
    private func logHistoryValue(_ text: String) {
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        historyText += "\n\(dateString) \(text)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyBoxView.layer.cornerRadius = 16
        counterBoxView.layer.cornerRadius = 16
        
        repeatButton.backgroundColor = .clear
        plusButton.backgroundColor = .clear
        minusButton.backgroundColor = .clear
        
        plusButton.tintColor = .red
        minusButton.tintColor = .blue
        
        counterValue = 0
        
        historyText = "История изменений:"
        
        configureDateFormatter()
        
        historyTextView.isEditable = false
        historyTextView.isSelectable = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onMinusTap(_ sender: Any) {
        if counterValue > 0 {
            counterValue -= 1
            logHistoryValue("значение изменено на -1")
        } else {
            logHistoryValue("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func onPlusTap(_ sender: Any) {
        counterValue += 1
        logHistoryValue("значение изменено на +1")
    }
    
    @IBAction func onRepeatTap(_ sender: Any) {
        counterValue = 0
        logHistoryValue("значение сброшено")
    }
    
    private func configureDateFormatter() {
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "[d MMMM, yy HH:mm]:"
    }
}

