//
//  QuestionViewController.swift
//  VGTrivia
//
//  Created by Shawn D. Hedgepeth on 11/13/20.
//  Copyright © 2020 Shawn D. Hedgepeth. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    var question: Question!
    
    @IBOutlet var titleLabel: UINavigationItem!
    @IBOutlet var question_numLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setButtons()
        setButtonBorderColors()
        questionLabel.attributedText = question.question.convertToAttributedString()
        questionLabel.textAlignment = .center
        question_numLabel.text = "Question \(question.questionNum)"
        titleLabel.title = "Question \(question.questionNum)"
    }
    
    func setButtons() {
        var answers = [question.incorrectAnswers[0], question.incorrectAnswers[1], question.incorrectAnswers[2], question.correctAnswer]
        answers.shuffle()
        button1.setAttributedTitle(answers[0].htmlToAttributedString, for: .normal)
        button2.setAttributedTitle(answers[1].htmlToAttributedString, for: .normal)
        button3.setAttributedTitle(answers[2].htmlToAttributedString, for: .normal)
        button4.setAttributedTitle(answers[3].htmlToAttributedString, for: .normal)
        
    }
    
    func setButtonBorderColors() {
        print("Setting border Colors")
        if question.is_answered == "yes" {
            if button1.currentAttributedTitle == question.correctAnswer.htmlToAttributedString {
                button1.borderColor = UIColor.green
                question.answeredCorrectly = "yes"
            }
            else {
                button1.borderColor = UIColor.red
            }
            if button2.currentAttributedTitle == question.correctAnswer.htmlToAttributedString {
                button2.borderColor = UIColor.green
                question.answeredCorrectly = "yes"
            }
            else {
                button2.borderColor = UIColor.red
            }
            if button3.currentAttributedTitle == question.correctAnswer.htmlToAttributedString {
                button3.borderColor = UIColor.green
                question.answeredCorrectly = "yes"
            }
            else {
                button3.borderColor = UIColor.red
            }
            if button4.currentAttributedTitle == question.correctAnswer.htmlToAttributedString {
                button4.borderColor = UIColor.green
                question.answeredCorrectly = "yes"
            }
            else {
                button4.borderColor = UIColor.red
            }
        }
    }
    
    @IBAction func selectedAnswer(_ sender: UIButton) {
        print("action worked")
        question.is_answered = "yes"
        if sender.currentAttributedTitle == question.correctAnswer.htmlToAttributedString {
            question.answeredCorrectly = "yes"
        }
        else {
            question.answeredCorrectly = "no"
        }
        setButtonBorderColors()
    }
}

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
}

