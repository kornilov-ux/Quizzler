//
//  Question.swift
//  9.Quizzler
//
//  Created by Alex  on 07.08.2023.
//

import Foundation

struct Question {
	var text: String
	var answer: [String]
	let rightAnswer: String
	
	init(q: String, a: [String], correctAnswer: String) {
		text = q
		answer = a
		rightAnswer = correctAnswer
	}
	
}
