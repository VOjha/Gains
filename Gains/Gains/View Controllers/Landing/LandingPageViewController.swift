//
//  LandingPageViewController.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/10/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {

  @IBOutlet var textItems: Array<UIView>?
  @IBOutlet weak var welcomeLabel: UILabel!
  @IBOutlet weak var viewStatsButton: UIButton!
  @IBOutlet weak var newExerciseButton: UIButton!

  let themeRedColor = UIColor(red: (255.0/255.0), green: (91.0/255.0), blue: (98.0/255.0), alpha: 1.0)
  let themeBlueColor = UIColor(red: (0.0/255.0), green: (122.0/255.0), blue: (255.0/255.0), alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  func styleView() {
    setLocalizedTextForViews(self.textItems!)

    // Welcome Label
    welcomeLabel.font = UIFont(name: "Rubik-Bold", size: 30)
    welcomeLabel.textColor = themeRedColor

    // Buttons
    viewStatsButton.titleLabel!.font = UIFont(name: "Rubik-Regular", size: 20)
    newExerciseButton.titleLabel!.font = UIFont(name: "Rubik-Regular", size: 20)

//    viewStatsButton.layer.borderWidth = 1.0
//    viewStatsButton.layer.cornerRadius = 5.0
//    viewStatsButton.layer.borderColor = themeBlueColor.cgColor
//
//    newExerciseButton.layer.borderWidth = 1.0
//    newExerciseButton.layer.cornerRadius = 5.0
//    newExerciseButton.layer.borderColor = themeBlueColor.cgColor
  }

  @IBAction func didClickNewExercise(_ sender: Any) {
    let newExerciseVC = NewExerciseViewController()
    self.navigationController?.pushViewController(newExerciseVC, animated: true)
  }

}
