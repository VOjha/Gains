//
//  RegisterViewController.swift
//  Gains
//
//  Created by Vidushi Ojha on 12/11/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit
import OktaAuth
//import Stormpath

class RegisterViewController: UIViewController {

  @IBOutlet var textItems: Array<UIView>?
  @IBOutlet var textButtons: Array<UIButton>?
  @IBOutlet var textTitles: Array<UILabel>?
  @IBOutlet var textLabels: Array<UILabel>?
  @IBOutlet var textFields: Array<UITextField>?

  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!

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

    // Text Fields
    styleTextFields(fields: textFields!, font: Fonts.textFieldFont!, textColor: Colors.themeBlueColor)

    // Title
    styleLabels(labels: textTitles!, font: Fonts.exerciseTypeTitleFont!, textColor: Colors.themeRedColor)
    
    // Labels
    styleLabels(labels: textLabels!, font: Fonts.textFieldLabelFont!, textColor: Colors.themeRedColor)

    // Buttons
    styleButtons(buttons: textButtons!, font: Fonts.buttonFont!, textColor: Colors.themeBlueColor)
  }

  @IBAction func didClickCreateAccount(_ sender: Any) {
    let url = URL(string: "https://dev-647368.oktapreview.com/api/v1/users?activate=true")
    var request = URLRequest(url: url!)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("SSWS \(String(describing: OktaAuth.tokens?.accessToken))", forHTTPHeaderField: "Authorization")
    request.httpMethod = "POST"

//    let postString =

//    let newUser = RegistrationModel(email: emailTextField.text!, password: passwordTextField.text!)
//    newUser.givenName = firstNameTextField.text!
//    newUser.surname = lastNameTextField.text!
//
//    Stormpath.sharedSession.register(newUser) { (account, error) -> Void in
//      if let error = error {
//        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
//        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
//        alertController.addAction(defaultAction)
//        self.present(alertController, animated: true, completion: nil)
//      } else {
//        let landingVC = LandingPageViewController()
//        self.navigationController?.pushViewController(landingVC, animated: true)
//      }
//    }
  }

}
