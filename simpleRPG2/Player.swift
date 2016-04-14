//
//  Player.swift
//  simpleRPG2
//
//  Created by Lance Douglas on 4/14/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//

import Foundation

class Player {
	private var _HP: Int = 100
	private var _attackPower: Int = 10
	private var _name: String = "Default"
	var HP: Int {
		get {
			return _HP
		}
	}
	var attackPower: Int {
		get {
			return _attackPower
		}
	}
	var name: String {
		get {
			return _name
		}
	}
	var isAlive: Bool {
		get {
			if HP <= 0 {
				return false
			} else {
				return true
			}
		}
	}
	
	init(HP: Int, attackPower: Int, name: String) {
		self._HP = HP
		self._attackPower = attackPower
		self._name = name
	}
	
	func attackPlayer() {
		let rand = Int(arc4random_uniform(UInt32(attackPower)) + 5)
		self._HP -= rand
	}
}