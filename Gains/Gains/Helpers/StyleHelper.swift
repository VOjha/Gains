//
//  StyleHelper.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/14/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit

func styleButtons(buttons: [UIButton], font: UIFont, textColor: UIColor) {
  for button in buttons {
    button.titleLabel!.font = font
    button.titleLabel!.textColor = textColor
  }
}

func styleLabels(labels: [UILabel], font: UIFont, textColor: UIColor) {
  for label in labels {
    label.font = font
    label.textColor = textColor
  }
}

func styleTextFields(fields: [UITextField], font: UIFont, textColor: UIColor) {
  for field in fields {
    field.font = font
    field.textColor = textColor
  }
}
