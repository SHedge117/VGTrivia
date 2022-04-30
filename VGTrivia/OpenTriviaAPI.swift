//
//  OpenTriviaAPI.swift
//  VGTrivia
//
//  Created by Shawn D. Hedgepeth on 11/11/20.
//  Copyright © 2020 Shawn D. Hedgepeth. All rights reserved.
//

import Foundation

struct OpenTriviaAPI {
    
    struct OpenTriviaResponse: Codable {
        let questions: [Question]
        
        enum CodingKeys: String, CodingKey {
            case questions = "results"
        }
    }
    
    static func trivia(fromJSON data: Data) -> Result<[Question], Error> {
        do {
            let decoder = JSONDecoder()
            let opentriviaResponse = try decoder.decode(OpenTriviaResponse.self, from: data)
            return .success(opentriviaResponse.questions)
        } catch {
            return .failure(error)
        }
    }
}
