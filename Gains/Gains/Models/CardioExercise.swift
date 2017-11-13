//
//  CardioExercise.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/13/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit

var cardioType = ExerciseType(name: "Cardio", icon: UIImage(named: "cardio-icon")!)

class CardioExercise: Exercise {
  var time: CGFloat

  init(name: String, time: CGFloat) {
    self.time = time
    super.init(name: name, type: cardioType)
  }
}
