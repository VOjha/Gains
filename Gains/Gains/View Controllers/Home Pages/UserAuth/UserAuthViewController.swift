//
//  UserAuthViewController.swift
//  Gains
//
//  Created by Vidushi Ojha on 12/11/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit
import OktaAuth

class UserAuthViewController: UIViewController {

  @IBOutlet var textItems: Array<UIView>?
  @IBOutlet var textButtons: Array<UIButton>?
  @IBOutlet var textLabels: Array<UILabel>?

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

    // Labels
    styleLabels(labels: textLabels!, font: Fonts.landingPageTitleFont!, textColor: Colors.themeRedColor)

    // Buttons
    styleButtons(buttons: textButtons!, font: Fonts.buttonFont!, textColor: Colors.themeBlueColor)
  }

  @IBAction func didClickRegister(_ sender: Any) {
    let registerVC = RegisterViewController()
    self.navigationController?.pushViewController(registerVC, animated: true)
  }

  @IBAction func didClickLogIn(_ sender: Any) {
    OktaAuth
      .login()
      .start(self) { response, error in
        if error != nil { print(error!) }

        if let tokenResponse = response {
          OktaAuth.tokens?.set(value: tokenResponse.accessToken!, forKey: "accessToken")
          OktaAuth.tokens?.set(value: tokenResponse.idToken!, forKey: "idToken")
          OktaAuth.tokens?.set(value: tokenResponse.refreshToken!, forKey: "refreshToken")
          print("Success! Received accessToken: \(tokenResponse.accessToken!)")
          print("Success! Received idToken: \(tokenResponse.idToken!)")
          print("Success! Received refreshToken: \(tokenResponse.refreshToken!)")

          let landingVC = LandingPageViewController()
          self.navigationController?.pushViewController(landingVC, animated: true)
        }
    }
  }

}
