//
//  ViewExerciseStatsViewController.swift
//  Gains
//
//  Created by Vidushi Ojha on 12/4/17.
//  Copyright © 2017 Vidushi Ojha. All rights reserved.
//

import UIKit
import Charts

class ViewExerciseStatsViewController: UIViewController {

  @IBOutlet var textItems: Array<UIView>?
  @IBOutlet var textTitles: Array<UILabel>?
  @IBOutlet var textButtons: Array<UIButton>?

  @IBOutlet weak var exerciseNameLabel: UILabel!
  @IBOutlet weak var iconImageView: UIImageView!
  @IBOutlet weak var barChartView: BarChartView!

  var selectedExercise: Exercise?

  let dateFormatter = DateFormatter()

  let barSpaceConst = 0.05
  let barWidthConst = 0.3
  let groupSpaceConst = 0.3

    override func viewDidLoad() {
        super.viewDidLoad()

        dateFormatter.dateFormat = "dd-MMM"
        styleView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  func setExercise(exercise: Exercise) {
    selectedExercise = exercise
  }

  func styleView() {
    setLocalizedTextForViews(textItems!)

    // Titles
    styleLabels(labels: textTitles!, font: Fonts.selectTypeTitleFont!, textColor: Colors.themeRedColor)
    exerciseNameLabel.text = selectedExercise?.name

    // Button
    styleButtons(buttons: textButtons!, font: Fonts.buttonFont!, textColor: Colors.themeBlueColor)

    // Icon
    iconImageView.image = selectedExercise?.type.icon

    switch selectedExercise?.type.name {
    case cardioType.name?:
      setUpCardioStats(exercise: selectedExercise as! CardioExercise)
    case stretchType.name?:
      setUpStretchStats(exercise: selectedExercise as! StretchExercise)
    case weightType.name?:
      setUpWeightStats(exercise: selectedExercise as! WeightExercise)
    default:
      return
    }
  }

  func setUpCardioStats(exercise: CardioExercise) {
    var dataEntries = [ChartDataEntry]()
    var dataLabels = [String]()

    let sortedKeys = Array(exercise.times.keys.sorted())

    for ind in 0...sortedKeys.count-1 {
      let dataPoint = BarChartDataEntry(x: Double(ind), y: exercise.times[sortedKeys[ind]]!)
      dataEntries.append(dataPoint)

      let dateString = dateFormatter.string(from: sortedKeys[ind])
      dataLabels.append(dateString)
    }

    styleAndFormatChart(dataEntries: [dataEntries], dataLabels: dataLabels, legends: ["Times (min)"])
  }

  func setUpStretchStats(exercise: StretchExercise) {
    var setsEntries = [ChartDataEntry]()
    var repsEntries = [ChartDataEntry]()
    var dataLabels = [String]()

    let sortedKeys = Array(exercise.stretches.keys.sorted())

    for ind in 0...sortedKeys.count-1 {
      let setPoint = BarChartDataEntry(x: Double(ind), y: exercise.stretches[sortedKeys[ind]]!["sets"]!)
      setsEntries.append(setPoint)

      let repPoint = BarChartDataEntry(x: Double(ind), y: exercise.stretches[sortedKeys[ind]]!["reps"]!)
      repsEntries.append(repPoint)

      let dateString = dateFormatter.string(from: sortedKeys[ind])
      dataLabels.append(dateString)
    }

    styleAndFormatChart(dataEntries: [setsEntries, repsEntries], dataLabels: dataLabels, legends: ["Sets", "Reps"])
  }

  func setUpWeightStats(exercise: WeightExercise) {
    var dataEntries = [ChartDataEntry]()
    var dataLabels = [String]()

    let sortedKeys = Array(exercise.weights.keys.sorted())

    for ind in 0...sortedKeys.count-1 {
      let dataPoint = BarChartDataEntry(x: Double(ind), y: exercise.weights[sortedKeys[ind]]!["weight"]!)
      dataEntries.append(dataPoint)

      let dateString = dateFormatter.string(from: sortedKeys[ind])
      dataLabels.append(dateString)
    }

    let marker = BalloonMarker(color: UIColor.white, font: Fonts.chartDataFont!, textColor: UIColor.black, insets: UIEdgeInsets(top: 7.0, left: 7.0, bottom: 25.0, right: 7.0))
    marker.setExercise(weightExercise: exercise)
    barChartView.marker = marker

    styleAndFormatChart(dataEntries: [dataEntries], dataLabels: dataLabels, legends: ["Weight (lbs)"])
  }

  func styleAndFormatChart(dataEntries: [[ChartDataEntry]], dataLabels: [String], legends: [String]) {
    let colors = [Colors.themeRedColor, Colors.themeBlueColor]

    var dataSets = [BarChartDataSet]()

    for i in 0...dataEntries.count-1 {
      let dataSet = BarChartDataSet(values: dataEntries[i], label: legends[i])
      dataSet.colors = [colors[i]]
      dataSet.valueFont = Fonts.chartDataFont!

      dataSets.append(dataSet)
    }

    let chartData = BarChartData(dataSets: dataSets)
    chartData.barWidth = barWidthConst

    barChartView.data = chartData

    barChartView.chartDescription?.text = ""

    barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: dataLabels)
    barChartView.xAxis.labelPosition = .bottom
    barChartView.xAxis.setLabelCount(dataLabels.count, force: false)

    barChartView.xAxis.drawGridLinesEnabled = false

    barChartView.legend.font = Fonts.chartLegendFont!

    barChartView.xAxis.labelFont = Fonts.chartDataFont!
    barChartView.leftAxis.labelFont = Fonts.chartDataFont!
    barChartView.rightAxis.labelFont = Fonts.chartDataFont!

    barChartView.animate(yAxisDuration: 1.0)

    if dataEntries.count > 1 {
      barChartView.groupBars(fromX: 0.0, groupSpace: groupSpaceConst, barSpace: barSpaceConst)

      barChartView.xAxis.axisMinimum = 0.0
      let groupGap = chartData.groupWidth(groupSpace: groupSpaceConst, barSpace: barSpaceConst)
      barChartView.xAxis.axisMaximum = groupGap + Double(dataLabels.count-1)

      barChartView.xAxis.centerAxisLabelsEnabled = true
    }
  }

  func capitalizeFirstLetter(word: String) -> String {
    let first = word.prefix(1).capitalized
    let rest = word.dropFirst()

    return first + rest
  }

  @IBAction func didClickHome(_ sender: Any) {
    let landingVC = LandingPageViewController()
    self.navigationController?.pushViewController(landingVC, animated: true)
  }

}
