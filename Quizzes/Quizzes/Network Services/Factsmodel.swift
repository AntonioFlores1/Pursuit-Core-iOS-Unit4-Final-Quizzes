//
//  Factsmodel.swift
//  Quizzes
//
//  Created by Pursuit on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct FactModels: Codable {
    let id: String
    let quizTitle: String
    let facts: [String]
}

