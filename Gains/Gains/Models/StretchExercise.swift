//
//  StretchExercise.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/13/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit

var stretchType = ExerciseType(name: "Stretch", icon: UIImage(named: "stretch-icon")!)

class StretchExercise: Exercise {
  init(name: String) {
    super.init(name: name, type: cardioType)
  }
}
