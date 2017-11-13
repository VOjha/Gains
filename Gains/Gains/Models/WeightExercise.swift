//
//  WeightExercise.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/10/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit

var weightType = ExerciseType(name: "Weight", icon: UIImage(named: "weight-icon")!)

class WeightExercise: Exercise {
  var weight: CGFloat

  init(name: String, weight: CGFloat) {
    self.weight = weight
    super.init(name: name, type: weightType)
  }
}
