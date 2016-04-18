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
	
	var leftGuy: Player!
	var rightGuy: Player!
	
	var a: String = ""
	var b: String = ""

	// MARK: Functions
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	//
	override func viewDidAppear(animated: Bool) {
		assignNames()
		leftAction.userInteractionEnabled = false
		rightAction.userInteractionEnabled = false
	}
	//
	@IBAction func letsPlay(sender: UIButton) {
		leftName.text = a
		rightName.text = b
		letsPlay.hidden = true
		startGame()
	}
	//
	@IBAction func rightAction(sender: UIButton) {
		if leftGuy.isAlive {
			leftGuy.attackPlayer()
			if leftGuy.HP > 0 {
				textBox.text = "\(leftGuy.name) has \(String(leftGuy.HP)) HP Left!"
				rightAction.userInteractionEnabled = false
				timeDelayRight()
			} else {
				textBox.text = "\(leftGuy.name) is Dead! Good job \(rightGuy.name)"
				endGame()
			}
		}
	}
	//
	@IBAction func leftAction(sender: UIButton) {
		if rightGuy.isAlive {
			rightGuy.attackPlayer()
			if rightGuy.HP > 0 {
				textBox.text = "\(rightGuy.name) has \(String(rightGuy.HP)) HP Left!"
				leftAction.userInteractionEnabled = false
				timeDelayLeft()
			} else {
				textBox.text = "\(rightGuy.name) is Dead! Good job \(leftGuy.name)"
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
	func timeDelayRight() {
		let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(1.5 * Double(NSEC_PER_SEC)))
		dispatch_after(delay, dispatch_get_main_queue()) {
			self.rightAction.userInteractionEnabled = true
		}
	}
	//
	func timeDelayLeft() {
		let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(1.5 * Double(NSEC_PER_SEC)))
		dispatch_after(delay, dispatch_get_main_queue()) {
			self.leftAction.userInteractionEnabled = true
		}
	}
	//
	func assignNames() {
		let firstAlert = UIAlertController(title: "Enter the left guy's name.", message: "Yeah, the one on the left.", preferredStyle: UIAlertControllerStyle.Alert)
		firstAlert.addTextFieldWithConfigurationHandler({
			textField in
			textField.placeholder = "Name Here"
		})
		
		let secondAlert = UIAlertController(title: "Enter the right guy's name.", message: "Now the right...", preferredStyle: UIAlertControllerStyle.Alert)
		secondAlert.addTextFieldWithConfigurationHandler({
			textField in
			textField.placeholder = "Name Here"
		})
		
		firstAlert.addAction(UIAlertAction(title: "Next", style: UIAlertActionStyle.Default, handler: {
			action in
			self.a = (firstAlert.textFields?[0].text)!
			self.presentViewController(secondAlert, animated :true, completion :nil)
		}))
		
		secondAlert.addAction(UIAlertAction(title: "Play!", style: UIAlertActionStyle.Default, handler: {
			action in
			self.b = (secondAlert.textFields?[0].text)!
		}))
		
		self.presentViewController(firstAlert, animated: true, completion: {})
	}
}

