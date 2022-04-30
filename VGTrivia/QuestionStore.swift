//
//  QuestionStore.swift
//  VGTrivia
//
//  Created by Shawn D. Hedgepeth on 11/10/20.
//  Copyright © 2020 Shawn D. Hedgepeth. All rights reserved.
//

import Foundation

class QuestionStore {
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchQuestions(completion: @escaping (Result<[Question], Error>) -> Void) {
        print("Fetching Questions...")
        if let url = URL(string: "https://opentdb.com/api.php?amount=15&category=15&type=multiple"){
            let request = URLRequest(url: url)
            let task = session.dataTask(with: request) {
                (data, response, error) in
                
                let result = self.proccessTriviaRequest(data: data, error: error)
                OperationQueue.main.addOperation{
                    completion(result)
                }
            }
            task.resume()
        }
    }
    
    private func proccessTriviaRequest(data: Data?, error: Error?) -> Result<[Question], Error> {
        guard let jsonData = data else {
            return .failure(error!)
        }
        
        return OpenTriviaAPI.trivia(fromJSON: jsonData)
    }
}
