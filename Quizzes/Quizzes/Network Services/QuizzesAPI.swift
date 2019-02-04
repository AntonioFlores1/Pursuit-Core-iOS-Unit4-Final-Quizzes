//
//  QuizzesAPI.swift
//  Quizzes
//
//  Created by Pursuit on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class QuizFactsAPI{
    static func facts(completionHandler: @escaping (AppError?,[FactModels]?)-> Void){
        let quizURL = "http://5c4d4c0d0de08100147c59b5.mockapi.io/api/v1/quizzes"
        NetworkHelper.shared.performDataTask(endpointURLString: quizURL, httpMethod: "GET", httpBody: nil) { (appError, factsB) in
            if let appError = appError{
                completionHandler(appError,nil)
            } else if let factsB = factsB {
                do {
    let facts = try JSONDecoder().decode([FactModels].self,from: factsB)
                    completionHandler(nil,facts)
                } catch {
        completionHandler(AppError.jsonDecodingError(error),nil)
                }
                
            }
        }
        
    }
}
