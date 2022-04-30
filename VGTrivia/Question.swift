//
//  Question.swift
//  VGTrivia
//
//  Created by Shawn D. Hedgepeth on 11/10/20.
//  Copyright © 2020 Shawn D. Hedgepeth. All rights reserved.
//

import Foundation

class Question: Codable {
    
    var is_answered = ""
    var answeredCorrectly = ""
    var questionNum = 0
    
    let question: String
    let difficulty: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    
    enum CodingKeys: String, CodingKey {
        case question = "question"
        case difficulty = "difficulty"
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}
