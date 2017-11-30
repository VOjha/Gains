//
//  Exercises.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/13/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit

class Exercises {
  var weightExercises: [String: WeightExercise]
  var cardioExercises: [String: CardioExercise]
  var stretchExercises: [String: StretchExercise]

  init() {
    self.weightExercises = [String: WeightExercise]()
    self.cardioExercises = [String: CardioExercise]()
    self.stretchExercises = [String: StretchExercise]()
  }

  func addExercise(exercise: Exercise) {
    switch exercise.type.name {
    case weightType.name:
      self.weightExercises[exercise.name] = exercise as? WeightExercise
    case cardioType.name:
      self.cardioExercises[exercise.name] = exercise as? CardioExercise
    case stretchType.name:
      self.stretchExercises[exercise.name] = exercise as? StretchExercise
    default:
      break
    }
  }

  func numCardioExercises() -> Int {
    return cardioExercises.count
  }

  func numStretchExercises() -> Int {
    return stretchExercises.count
  }

  func numWeightExercises() -> Int {
    return weightExercises.count
  }

  func getCardioExercise(name: String) -> CardioExercise {
    return cardioExercises[name]!
  }

  func getStretchExercise(name: String) -> StretchExercise {
    return stretchExercises[name]!
  }

  func getWeightExercise(name: String) -> WeightExercise {
    return weightExercises[name]!
  }
}
