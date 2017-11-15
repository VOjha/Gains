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
  var weights: [Date: [String: Double]]

  init(name: String) {
    self.weights = [Date: [String: Double]]()
    super.init(name: name, type: weightType)
  }

  func addDataPoint(date: Date, weight: Double, sets: Double, reps: Double) {
    var data = [String: Double]()
    data["weight"] = weight
    data["sets"] = sets
    data["reps"] = reps
    self.weights[date] = data;
  }
}
