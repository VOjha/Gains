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
  var weights: [NSDate: [String: CGFloat]]

  init(name: String) {
    self.weights = [NSDate: [String: CGFloat]]()
    super.init(name: name, type: weightType)
  }

  func addDataPoint(date: NSDate, weight: CGFloat, sets: CGFloat, reps: CGFloat) {
    var data = [String: CGFloat]()
    data["weight"] = weight
    data["sets"] = sets
    data["reps"] = reps
    self.weights[date] = data;
  }
}
