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
  @IBOutlet weak var minutesTextField: UITextField!
  @IBOutlet weak var minutesLabel: UILabel!
  @IBOutlet weak var secondsTextField: UITextField!
  @IBOutlet weak var secondsLabel: UILabel!

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

    minutesTextField.font = Fonts.textFieldFont
    minutesTextField.textColor = Colors.themeBlueColor

    secondsTextField.font = Fonts.textFieldFont
    secondsTextField.textColor = Colors.themeBlueColor

    // Labels styled as Text Fields
    minutesLabel.font = Fonts.textFieldFont
    minutesLabel.textColor = Colors.themeBlueColor

    secondsLabel.font = Fonts.textFieldFont
    secondsLabel.textColor = Colors.themeBlueColor

    // Buttons
    saveButton.titleLabel!.font = Fonts.buttonFont
  }

  @IBAction func didClickSave(_ sender: Any) {
    let name = exerciseNameTextField.text
    let newCardioExercise = CardioExercise(name: name!)

    let mins = Double(self.minutesTextField.text!) ?? 0
    let secs = Double(self.secondsTextField.text!) ?? 0

    newCardioExercise.addDataPoint(date: datePicker.selectedDate, minutes: mins, seconds: secs)

    cardioExercises[name!] = newCardioExercise
  }

}
