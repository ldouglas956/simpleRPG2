//
//  ViewController.swift
//  simpleRPG2
//
//  Created by Lance Douglas on 4/14/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// MARK: Variables
	@IBOutlet weak var leftPlayer: UIImageView!
	@IBOutlet weak var rightPlayer: UIImageView!
	@IBOutlet weak var textBox: UILabel!
	@IBOutlet weak var leftAction: UIButton!
	@IBOutlet weak var rightAction: UIButton!
	@IBOutlet weak var resetButton: UIButton!
	@IBOutlet weak var leftName: UITextField!
	@IBOutlet weak var rightName: UITextField!
	@IBOutlet weak var letsPlay: UIButton!
	@IBOutlet weak var letsPlay2: UIButton!
	
	var leftGuy: Player!
	var rightGuy: Player!

	// MARK: Functions
	override func viewDidLoad() {
		super.viewDidLoad()
		leftName.userInteractionEnabled = false
		rightName.userInteractionEnabled = false
		letsPlay2.hidden = true
	}
	//
	override func viewDidAppear(animated: Bool) {
		popupLeft("Left Guy")
	}
	//
	@IBAction func letsPlay(sender: UIButton) {
		popupRight("Right Guy")
		letsPlay.hidden = true
		letsPlay2.hidden = false
	}
	//
	@IBAction func letsPlay2(sender: UIButton) {
		letsPlay2.hidden = true
		startGame()
	}
	//
	@IBAction func rightAction(sender: UIButton) {

		if leftGuy.isAlive {
			leftGuy.attackPlayer()
			if leftGuy.HP >= 0 {
				textBox.text = "\(leftGuy.name) has \(String(leftGuy.HP)) HP Left!"
			} else {
				textBox.text = "\(leftGuy.name) is Dead!"
				endGame()
			}
		}
	}
	//
	@IBAction func leftAction(sender: UIButton) {
		if rightGuy.isAlive {
			rightGuy.attackPlayer()
			if rightGuy.HP >= 0 {
				textBox.text = "\(rightGuy.name) has \(String(rightGuy.HP)) HP Left!"
			} else {
				textBox.text = "\(rightGuy.name) is Dead!"
				endGame()
			}
		}
	}
	//
	@IBAction func resetButton(sender: UIButton) {
		startGame()
		resetButton.hidden = true
	}
	//
	func startGame() {
		letsPlay.hidden = true
		leftGuy = Player(HP: 100, attackPower: 10, name: leftName.text!)
		rightGuy = Player(HP: 100, attackPower: 10, name: rightName.text!)
		textBox.text = "Someone attack already!"
		leftAction.userInteractionEnabled = true
		rightAction.userInteractionEnabled = true
	}
	//
	func endGame() {
		resetButton.hidden = false
		leftAction.userInteractionEnabled = false
		rightAction.userInteractionEnabled = false
	}
	//
	func popupLeft(name: String) {
		var alertController1: UIAlertController?
		alertController1 = UIAlertController(title: "Enter \(name)'s Name", message: "Yeah, the one on the left", preferredStyle: .Alert)
		
		alertController1!.addTextFieldWithConfigurationHandler(
			{(textField: UITextField!) in textField.placeholder = "Name goes here..."})
		
		let action1 = UIAlertAction(title: "Play!", style: UIAlertActionStyle.Default, handler: {[weak self]
			(paramAction: UIAlertAction!) in
			if let textFields = alertController1?.textFields{
				let theTextFields = textFields as [UITextField]
				let enteredText = theTextFields[0].text
				self!.leftName.text = enteredText}})
		
		alertController1?.addAction(action1)
		self.presentViewController(alertController1!, animated: true, completion: nil)
	}
	//
	func popupRight(name: String) {
		var alertController2: UIAlertController?
		alertController2 = UIAlertController(title: "Enter \(name)'s Name", message: "You didn't think I forgot about you, did you?", preferredStyle: .Alert)
		
		alertController2!.addTextFieldWithConfigurationHandler(
			{(textField: UITextField!) in textField.placeholder = "Name goes here..."})
		
		let action1 = UIAlertAction(title: "Play!", style: UIAlertActionStyle.Default, handler: {[weak self]
			(paramAction: UIAlertAction!) in
			if let textFields = alertController2?.textFields{
				let theTextFields = textFields as [UITextField]
				let enteredText = theTextFields[0].text
				self!.rightName.text = enteredText}})
		
		alertController2?.addAction(action1)
		self.presentViewController(alertController2!, animated: true, completion: nil)
	}
	//
	
}

