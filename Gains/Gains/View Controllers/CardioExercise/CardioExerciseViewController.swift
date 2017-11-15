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
  @IBOutlet var textButtons: Array<UIButton>?
  @IBOutlet var textFields: Array<UITextField>?
  @IBOutlet var textLabelsAsFields: Array<UILabel>?
  @IBOutlet var textTitles: Array<UILabel>?
  @IBOutlet var textLabels: Array<UILabel>?
  @IBOutlet weak var datePicker: CustomDatePicker! // keep

  @IBOutlet weak var exerciseNameField: UITextField!
  @IBOutlet weak var minutesField: UITextField!
  @IBOutlet weak var secondsField: UITextField!

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
    styleLabels(labels: textTitles!, font: Fonts.exerciseTypeTitleFont!, textColor: Colors.themeRedColor)

    // Labels
    styleLabels(labels: textLabels!, font: Fonts.textFieldLabelFont!, textColor: Colors.themeRedColor)

    // Text Fields
    styleTextFields(fields: textFields!, font: Fonts.textFieldFont!, textColor: Colors.themeBlueColor)

    // Labels styled as Text Fields
    styleLabels(labels: textLabelsAsFields!, font: Fonts.textFieldFont!, textColor: Colors.themeBlueColor)

    // Buttons
    styleButtons(buttons: textButtons!, font: Fonts.buttonFont!, textColor: Colors.themeBlueColor)
  }

  @IBAction func didClickSave(_ sender: Any) {
    let name = exerciseNameField.text
    let newCardioExercise = CardioExercise(name: name!)

    let mins = Double(self.minutesField.text!) ?? 0
    let secs = Double(self.secondsField.text!) ?? 0

    newCardioExercise.addDataPoint(date: datePicker.selectedDate, minutes: mins, seconds: secs)

    cardioExercises[name!] = newCardioExercise
  }

}
