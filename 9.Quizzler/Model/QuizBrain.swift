//
//  QuizBrain.swift
//  9.Quizzler
//
//  Created by Alex  on 08.08.2023.
//

import Foundation


struct QuizBrain {
	
	let quize = [ Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
				  Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
				  Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
				  Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
				  Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
				  Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
				  Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
				  Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
				  Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
				  Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
	] 
	
	
	var questionNumber = 0
	lazy var quantityQuestion = quize.count
	var score = 0  
	
	mutating func checkAnswer(_ userAnswer: String) -> Bool {
		if userAnswer == quize[questionNumber].rightAnswer {
			score += 1 
			return true
		} else {
			return false
		}
	}
	
	func getQuestionText() -> String {
		return quize[questionNumber].text
	}
	
	mutating func getProgress() -> Float {
		let progress = Float(questionNumber + 1) / Float(quantityQuestion)
		return progress
	}
	
	func getAnswers() -> [String] {
		return quize[questionNumber].answer.shuffled()
		}
	
	func getScore() -> Int {
		return score
	}
	
	
	mutating func nextQuestion() {
		
		if questionNumber + 1 < quize.count {
			questionNumber += 1
		} else {
			questionNumber = 0
			score = 0
			
		}
		
	}
	
	
}
