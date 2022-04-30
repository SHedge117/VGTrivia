//
//  QuestionDataSource.swift
//  VGTrivia
//
//  Created by Shawn D. Hedgepeth on 11/12/20.
//  Copyright © 2020 Shawn D. Hedgepeth. All rights reserved.
//

import UIKit

class QuestionDataSource: NSObject, UITableViewDataSource {
    
    var questions = [Question]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        let question = questions[indexPath.row]
        if question.answeredCorrectly == "yes" {
            cell.textLabel?.textColor = UIColor.green
        }
        else if question.answeredCorrectly == "no" {
            cell.textLabel?.textColor = UIColor.red
        }
        cell.question_numLabel.text = "Question " + String(indexPath.row + 1)
        cell.difficultyLabel.text = "Difficulty: \(question.difficulty)"
        if question.difficulty == "easy" {
            cell.difficultyLabel.textColor = UIColor(red: 0.3, green: 0.738, blue: 0.511, alpha: 1.0)
        }
        else if question.difficulty == "medium" {
            cell.difficultyLabel.textColor = UIColor(red: 0.835, green: 0.382, blue: 0.003, alpha: 1.0)
        }
        else {
            cell.difficultyLabel.textColor = UIColor(red: 0.687, green: 0.097, blue: 0.062, alpha: 1.0)
        }
        return cell
    }
}
