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

    // Labels
    cardioTypeLabel.font = UIFont(name: "Rubik-Bold", size: 35)
    cardioTypeLabel.textColor = Colors.themeRedColor

    exerciseNameLabel.font = UIFont(name: "Rubik-Medium", size: 17)
    exerciseNameLabel.textColor = Colors.themeRedColor

    startDateLabel.font = UIFont(name: "Rubik-Medium", size: 17)
    startDateLabel.textColor = Colors.themeRedColor

    // Text Fields
    exerciseNameTextField.font = UIFont(name: "Rubik-Light", size: 25)
    exerciseNameTextField.textColor = Colors.themeBlueColor
  }

}
