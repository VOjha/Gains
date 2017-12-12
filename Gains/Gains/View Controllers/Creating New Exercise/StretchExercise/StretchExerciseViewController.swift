//
//  StretchExerciseViewController.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/15/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import os.log
import UIKit

class StretchExerciseViewController: UIViewController {

  @IBOutlet var textItems: Array<UIView>?
  @IBOutlet var textLabels: Array<UILabel>?
  @IBOutlet var textTitles: Array<UILabel>?
  @IBOutlet var textFields: Array<UITextField>?
  @IBOutlet var textButtons: Array<UIButton>?
  @IBOutlet weak var scrollView: UIScrollView!

  @IBOutlet weak var exerciseNameField: UITextField!
  @IBOutlet weak var datePicker: CustomDatePicker!
  @IBOutlet weak var setsField: UITextField!
  @IBOutlet weak var repsField: UITextField!

  let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  override func viewDidLayoutSubviews() {
    scrollView.contentSize = CGSize(width: scrollView.contentSize.width, height: SizeConstants.newStretchScreenHeight)
  }

  func styleView() {
    setLocalizedTextForViews(self.textItems!)

    // Title
    styleLabels(labels: textTitles!, font: Fonts.exerciseTypeTitleFont!, textColor: Colors.themeRedColor)

    // Labels
    styleLabels(labels: textLabels!, font: Fonts.textFieldLabelFont!, textColor: Colors.themeRedColor)

    // Text Fields
    styleTextFields(fields: textFields!, font: Fonts.textFieldFont!, textColor: Colors.themeBlueColor)

    // Buttons
    styleButtons(buttons: textButtons!, font: Fonts.buttonFont!, textColor: Colors.themeBlueColor)
  }

  @IBAction func didClickSave(_ sender: Any) {
    let name = exerciseNameField.text
    let newStretchExercise = StretchExercise(name: name!)

    let sets = Double(self.setsField.text!) ?? 0
    let reps = Double(self.repsField.text!) ?? 0

    newStretchExercise.addDataPoint(date: datePicker.selectedDate, sets: sets, reps: reps)

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.exercises?.addExercise(exercise: newStretchExercise)

    saveStretchExercises()

    let landingVC = LandingPageViewController()
    self.navigationController?.pushViewController(landingVC, animated: true)
  }

  private func saveStretchExercises() {
    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject((appDelegate.exercises?.stretchExercises)!, toFile: FilePaths.stretchURL.path)

    if isSuccessfulSave {
      os_log("Stretch Exercises successfully saved.", log: OSLog.default, type: .debug)
    } else {
      os_log("Failed to save Stretch Exercises... ", log: OSLog.default, type: .error)
    }
  }

  @IBAction func didTap(_ sender: Any) {
    for field in textFields! {
      field.resignFirstResponder()
    }
  }

}
