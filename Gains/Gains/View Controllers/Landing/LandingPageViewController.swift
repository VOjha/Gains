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
  @IBOutlet weak var enterDataButton: UIButton!

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
    welcomeLabel.font = Fonts.landingPageTitleFont
    welcomeLabel.textColor = Colors.themeRedColor

    // Buttons
    viewStatsButton.titleLabel!.font = Fonts.buttonFont
    newExerciseButton.titleLabel!.font = Fonts.buttonFont
    enterDataButton.titleLabel!.font = Fonts.buttonFont
  }

  @IBAction func didClickNewExercise(_ sender: Any) {
    let newExerciseVC = NewExerciseTypeViewController()
    self.navigationController?.pushViewController(newExerciseVC, animated: true)
  }

}
