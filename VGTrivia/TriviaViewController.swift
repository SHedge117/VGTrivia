//
//  ViewController.swift
//  VGTrivia
//
//  Created by Shawn D. Hedgepeth on 11/10/20.
//  Copyright © 2020 Shawn D. Hedgepeth. All rights reserved.
//

import UIKit

class TriviaViewController: UITableViewController {
    var store: QuestionStore!
    let questionDataSource = QuestionDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 75
        
        tableView.dataSource = questionDataSource
        store.fetchQuestions {
            (questionsResult) in
            
            switch questionsResult {
            case let .success(trivia):
                print("Successfully found \(trivia.count) questions")
                self.questionDataSource.questions = trivia
            case let .failure(error):
                print("Error fetching questions: \(error)")
                self.questionDataSource.questions.removeAll()
            }
            self.tableView.reloadData()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showQuestion" {
            print("segue worked")
            if let row = tableView.indexPathForSelectedRow?.row {
                print("Got row")
                let question = questionDataSource.questions[row]
                if let num = tableView.indexPathForSelectedRow?.row {
                    question.questionNum = num + 1
                }
                let questionViewController = segue.destination as! QuestionViewController
                questionViewController.question = question
            }
        }
        else {
            preconditionFailure("Unexpected segue identifier")
        }
    }


}

