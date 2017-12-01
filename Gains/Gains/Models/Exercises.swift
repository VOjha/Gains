//
//  Exercises.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/13/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit

class Exercises {
  var weightExercises: [WeightExercise]
  var cardioExercises: [CardioExercise]
  var stretchExercises: [StretchExercise]

  init() {
    self.weightExercises = [WeightExercise]()
    self.cardioExercises = [CardioExercise]()
    self.stretchExercises = [StretchExercise]()
  }

  func addExercise(exercise: Exercise) {
    switch exercise.type.name {
    case weightType.name:
      self.weightExercises.append((exercise as? WeightExercise)!)
    case cardioType.name:
      self.cardioExercises.append((exercise as? CardioExercise)!)
    case stretchType.name:
      self.stretchExercises.append((exercise as? StretchExercise)!)
    default:
      break
    }
  }

  func getCardioExercise(index: Int) -> CardioExercise {
    return cardioExercises[index]
  }

  func getStretchExercise(index: Int) -> StretchExercise {
    return stretchExercises[index]
  }

  func getWeightExercise(index: Int) -> WeightExercise {
    return weightExercises[index]
  }

  func cardioExerciseKeys() -> [String] {
    var results = [String]()

    for ex in cardioExercises {
      results.append(ex.name)
    }

    return results
  }

  func stretchExerciseKeys() -> [String] {
    var results = [String]()

    for ex in stretchExercises {
      results.append(ex.name)
    }

    return results
  }

  func weightExerciseKeys() -> [String] {
    var results = [String]()

    for ex in weightExercises {
      results.append(ex.name)
    }

    return results
  }

  func loadExercises() {
    if let cardioExs = NSKeyedUnarchiver.unarchiveObject(withFile: FilePaths.cardioURL.path) as? [CardioExercise] {
      cardioExercises = cardioExs
    }

    if let stretchExs = NSKeyedUnarchiver.unarchiveObject(withFile: FilePaths.stretchURL.path) as? [StretchExercise] {
      stretchExercises = stretchExs
    }

    if let weightExs = NSKeyedUnarchiver.unarchiveObject(withFile: FilePaths.weightsURL.path) as? [WeightExercise] {
      weightExercises = weightExs
    }
  }

}
