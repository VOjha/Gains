//
//  Exercise.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/10/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit

struct ExerciseType {
  var name: String
  var icon: UIImage
}

class Exercise {
  var name: String
  var type: ExerciseType

  init(name: String, type: ExerciseType) {
    self.name = name
    self.type = type
  }
}
