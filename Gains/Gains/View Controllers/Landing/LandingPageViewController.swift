//
//  LandingPageViewController.swift
//  Gains
//
//  Created by Vidushi Ojha on 11/10/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit

typealias QueryResult = (Data?, String) -> ()

class LandingPageViewController: UIViewController {

  @IBOutlet var textItems: Array<UIView>?
  @IBOutlet var textButtons: Array<UIButton>?
  @IBOutlet var textLabels: Array<UILabel>?

    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
        makeRequest() { results, errorMessage in
          if let results = results {
            print("got some stuff: \(results)")
          }
          if !errorMessage.isEmpty { print("Search error: " + errorMessage) }
        }
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

  @IBAction func didClickViewStats(_ sender: Any) {
    let viewStatsVC = ViewStatsViewController()
    self.navigationController?.pushViewController(viewStatsVC, animated: true)
  }

  @IBAction func didClickNewExercise(_ sender: Any) {
    let newExerciseVC = NewExerciseTypeViewController()
    self.navigationController?.pushViewController(newExerciseVC, animated: true)
  }

  @IBAction func didClickEnterData(_ sender: Any) {
    let enterDataVC = EnterDataViewController()
    self.navigationController?.pushViewController(enterDataVC, animated: true)
  }

  func makeRequest(completion: @escaping QueryResult) {
    var errorMessage =  ""

    let defaultSession = URLSession(configuration: .default)

    var dataTask: URLSessionDataTask?

    // iTunes search, for now, because of ATS issues
    if var urlComponents = URLComponents(string: "https://itunes.apple.com/search") {
      urlComponents.query = "media=music&entity=song&term=weezer"

      guard let url = urlComponents.url else { return }

      dataTask = defaultSession.dataTask(with: url) { data, response, error in
        defer { dataTask = nil }

        if let error = error {
          errorMessage = "DataTask error: " + error.localizedDescription
        } else if let data = data,
          let response = response as? HTTPURLResponse,
          response.statusCode == 200 {
          DispatchQueue.main.async { completion(data, errorMessage) }
        }
      }
      dataTask?.resume()
    }
  }

}
