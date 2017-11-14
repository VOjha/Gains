//
//  CardioExerciseViewController.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/13/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit

class CardioExerciseViewController: UIViewController {

  @IBOutlet var textItems: Array<UIView>?
  @IBOutlet weak var cardioTypeLabel: UILabel!
  @IBOutlet weak var exerciseNameLabel: UILabel!
  @IBOutlet weak var exerciseNameTextField: UITextField!
  @IBOutlet weak var startDateLabel: UILabel!
  @IBOutlet weak var datePicker: CustomDatePicker!
  @IBOutlet weak var saveButton: UIButton!
  @IBOutlet weak var durationLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  func styleView() {
    setLocalizedTextForViews(textItems!)

    // Title
    cardioTypeLabel.font = Fonts.exerciseTypeTitleFont
    cardioTypeLabel.textColor = Colors.themeRedColor

    // Labels
    exerciseNameLabel.font = Fonts.textFieldLabelFont
    exerciseNameLabel.textColor = Colors.themeRedColor

    startDateLabel.font = Fonts.textFieldLabelFont
    startDateLabel.textColor = Colors.themeRedColor

    durationLabel.font = Fonts.textFieldLabelFont
    durationLabel.textColor = Colors.themeRedColor

    // Text Fields
    exerciseNameTextField.font = Fonts.textFieldFont
    exerciseNameTextField.textColor = Colors.themeBlueColor

    // Buttons
    saveButton.titleLabel!.font = Fonts.buttonFont
  }

  @IBAction func didClickSave(_ sender: Any) {
    // save new cardio exercise
  }

}
