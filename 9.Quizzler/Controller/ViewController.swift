//
//  ViewController.swift
//  9.Quizzler
//
//  Created by Alex  on 05.08.2023.
//

import UIKit

class ViewController: UIViewController {
	
	
	@IBOutlet weak var scoreLabel: UILabel!
	@IBOutlet weak var progressBar: UIProgressView!
	@IBOutlet weak var questionLabel: UILabel!
	
	@IBOutlet weak var trueButton: UIButton!
	@IBOutlet weak var falseButton: UIButton!
	@IBOutlet weak var trueButton2: UIButton!
	
	var quizBrain = QuizBrain()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		updateUI()
	}
	
	
	@IBAction func answerButtonPressed(_ sender: UIButton) {
		
		let userAnswer = sender.currentTitle! 
		let userGotItRight = quizBrain.checkAnswer(userAnswer)
		
		if userGotItRight {
			sender.backgroundColor = UIColor.green 
			sender.layer.cornerRadius = 25
			sender.clipsToBounds = true
		} else {
			sender.backgroundColor = UIColor.red
			sender.layer.cornerRadius = 25
			sender.clipsToBounds = true
		}		
		
		quizBrain.nextQuestion()	

		updateUI()
		 
	}
	
	
	func updateUI() {
		
		questionLabel.textAlignment = .center
		questionLabel.text = quizBrain.getQuestionText()
		
		let answerChoices = quizBrain.getAnswers()
		trueButton.setTitle(answerChoices[0], for: .normal)
		trueButton2.setTitle(answerChoices[1], for: .normal)
		falseButton.setTitle(answerChoices[2], for: .normal)
		
		progressBar.progress = quizBrain.getProgress()
		scoreLabel.text = "Score: \(quizBrain.getScore())"
		
		// delay color on button
		Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { (timer) in
			self.trueButton.backgroundColor = .clear
			self.falseButton.backgroundColor = .clear
			self.trueButton2.backgroundColor = .clear
		}
		
		progressBar.progress += 1
		progressBar.progress = quizBrain.getProgress()
		
		scoreLabel.text = "Score: \(quizBrain.getScore())"
	}
	
	
}

