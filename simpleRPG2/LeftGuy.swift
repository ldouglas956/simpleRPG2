//
//  LeftGuy.swift
//  simpleRPG2
//
//  Created by Lance Douglas on 4/14/16.
//  Copyright © 2016 Lance Douglas. All rights reserved.
//

import Foundation

class LeftGuy: Player {

	private var _age: Int = 25
	var age: Int {
		get {
			return _age
		}
	}
	convenience init(age: Int, HP: Int, attackPower: Int, name: String) {
		self.init(HP: HP, attackPower: attackPower, name: name)
		_age = age
	}
	
}
