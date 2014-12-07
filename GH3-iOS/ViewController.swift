//
//  ViewController.swift
//  GH3-iOS
//
//  Created by Li Zeng on 12/6/14.
//  Copyright (c) 2014 CarlorClub. All rights reserved.
//

import UIKit

class ViewController: UIViewController, JBLineChartViewDelegate, JBLineChartViewDataSource{
    
    var backgroundImage: UIImage!
    var weatherCardView: StatsCardView!
    var savingCardView: StatsCardView!
    var chartCardView: TCharView!
    var roomDisplayCardView: DisplayCardView!
    var controlCardView: ControlCardView
    var homeCardView: HomeCardView
    var background: UIImageView!
    
    var chartData: [[NSNumber]]!
    var timeSymbols: NSMutableArray!
    
    var selectedLineIndex: UInt
    var selectedHorizontalIndex: UInt
    var touchedPoint: CGPoint?
    
    var currentTemperature: Int
    
    var weatherAnimationTimer: NSTimer?
    var savingAnimationTimer: NSTimer?
    var roomDisplayAnimationTimer: NSTimer?
    
    required init(coder aDecoder: NSCoder) {
        backgroundImage = UIImage(named: "Back-Blurred")
        background = UIImageView(image: backgroundImage)
        
        weatherCardView = StatsCardView(frame: CGRectMake(370, 20, 300, 350))
        weatherCardView.setupUI("Weather", indicatorImageString: "Dot-Red")
        weatherCardView.setupWeatherDisplay()
        
        savingCardView = StatsCardView(frame: CGRectMake(710, 20, 300, 350))
        savingCardView.setupUI("Savings", indicatorImageString: "Dot-Blue")
        savingCardView.setupSavingsDisplay()
        
        roomDisplayCardView = DisplayCardView(frame: CGRectMake(70, 20, 250, 250))
        roomDisplayCardView.setupUI()
        
        controlCardView = ControlCardView(frame: CGRectMake(70, 280, 250, 250))
        controlCardView.setupUI()
        
        homeCardView = HomeCardView(frame: CGRectMake(70, 540, 250, 250))
        homeCardView.setupUI()
        
        chartCardView = TCharView(frame: CGRectMake(370, 400, 640, 350))
        chartCardView.setupUI("Suggestion", indicatorImageString: "Dot-Orange")
        
        selectedLineIndex = 0
        selectedHorizontalIndex = 0
        touchedPoint = nil
        
        currentTemperature = 65
        
        controlCardView.updateTemperature(currentTemperature)
        
        super.init(nibName: nil, bundle: nil)
        chartCardView.lineChartView.delegate = self
        chartCardView.lineChartView.dataSource = self
        
        var upBtnTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "upBtnAction")
        controlCardView.upBtn!.addGestureRecognizer(upBtnTap)
        
        var downBtnTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "downBtnAction")
        controlCardView.downBtn!.addGestureRecognizer(downBtnTap)
        
    }
    
    func upBtnAction() {
        var value: NSNumber = chartData[Int(selectedLineIndex)][Int(selectedHorizontalIndex)]
        chartData[Int(selectedLineIndex)][Int(selectedHorizontalIndex)] = NSNumber(float: value.floatValue+100000)
        chartCardView.lineChartView.reloadData()
        controlCardView.updateTemperature(++currentTemperature)
        if touchedPoint != nil {
            chartCardView.lineChartView.simulateTouch(touchedPoint!)
            savingCardView.updateSavingFigure(false)
        }
    }
    
    func downBtnAction() {
        var value: NSNumber = chartData[Int(selectedLineIndex)][Int(selectedHorizontalIndex)]
        var newValue: NSNumber = NSNumber(float: value.floatValue-100000)
        if newValue.floatValue < 0 {
            newValue = NSNumber(float: 0.0)
        }
        chartData[Int(selectedLineIndex)][Int(selectedHorizontalIndex)] = newValue
        chartCardView.lineChartView.reloadData()
        controlCardView.updateTemperature(--currentTemperature)
        if touchedPoint != nil {
            chartCardView.lineChartView.simulateTouch(touchedPoint!)
            savingCardView.updateSavingFigure(true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(background)
        background.addSubview(weatherCardView)
        background.addSubview(savingCardView)
        background.addSubview(roomDisplayCardView)
        background.addSubview(controlCardView)
        background.addSubview(homeCardView)
        background.addSubview(chartCardView)
        
        initFakeData()
        chartCardView.lineChartView.reloadData()
        
        background.userInteractionEnabled = true
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        savingCardView.showSavingAnimation()
        chartCardView.lineChartView.setState(JBChartViewState.Expanded, animated: false)
        
        weatherAnimationTimer = NSTimer.scheduledTimerWithTimeInterval(30, target: weatherCardView, selector: "scaleAnimate", userInfo: nil, repeats: true)
        savingAnimationTimer = NSTimer.scheduledTimerWithTimeInterval(5, target: savingCardView, selector: "scaleAnimate", userInfo: nil, repeats: true)
        roomDisplayAnimationTimer = NSTimer.scheduledTimerWithTimeInterval(20, target: roomDisplayCardView, selector: "scaleAnimate", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // TEST
    func initFakeData() {
        chartData = []
        for var lineIndex = 0; lineIndex < 2; lineIndex++ {
            var mutableChartData: [NSNumber] = []
            for var i = 0; i < 12; i++ {
                mutableChartData.append((NSNumber(float: Float(arc4random()/10000)*12)))
            }
            chartData.append(mutableChartData)
        }
        timeSymbols = NSMutableArray(array:  NSDateFormatter().shortMonthSymbols)
    }

    // Data Source
    
    func numberOfLinesInLineChartView(lineChartView: JBLineChartView!) -> UInt {
        return UInt(chartData.count)
    }
    
    func lineChartView(lineChartView: JBLineChartView!, numberOfVerticalValuesAtLineIndex lineIndex: UInt) -> UInt {
        return UInt(chartData[Int(lineIndex)].count)
    }
    
    func lineChartView(lineChartView: JBLineChartView!, showsDotsForLineAtLineIndex lineIndex: UInt) -> Bool {
        return false
    }
    
    func lineChartView(lineChartView: JBLineChartView!, smoothLineAtLineIndex lineIndex: UInt) -> Bool {
        return true
    }
    
    // Delegate
    
    func lineChartView(lineChartView: JBLineChartView!, verticalValueForHorizontalIndex horizontalIndex: UInt, atLineIndex lineIndex: UInt) -> CGFloat {
        return CGFloat(chartData[Int(lineIndex)][Int(horizontalIndex)].floatValue)
    }
    
    func lineChartView(lineChartView: JBLineChartView!, didSelectLineAtIndex lineIndex: UInt, horizontalIndex: UInt, touchPoint: CGPoint) {
        selectedLineIndex = lineIndex
        selectedHorizontalIndex = horizontalIndex
        touchedPoint = touchPoint
    }
    
    func lineChartView(lineChartView: JBLineChartView!, colorForLineAtLineIndex lineIndex: UInt) -> UIColor! {
        if lineIndex == 0 {
            return UIColor(hexString: "#FF9933", alpha: 0.5)
        }
        return UIColor(hexString: "#33CC66", alpha: 0.5)
    }
    
    func lineChartView(lineChartView: JBLineChartView!, fillColorForLineAtLineIndex lineIndex: UInt) -> UIColor! {
        if lineIndex == 0 {
            return UIColor(hexString: "#FF9933", alpha: 0.5)
        }
        return UIColor(hexString: "#33CC66", alpha: 0.5)
    }

    func lineChartView(lineChartView: JBLineChartView!, colorForDotAtHorizontalIndex horizontalIndex: UInt, atLineIndex lineIndex: UInt) -> UIColor! {
        if lineIndex == 0 {
            return UIColor(hexString: "#FF9933", alpha: 0.5)
        }
        return UIColor(hexString: "#33CC66", alpha: 0.5)
    }
    
    func lineChartView(lineChartView: JBLineChartView!, widthForLineAtLineIndex lineIndex: UInt) -> CGFloat {
        return CGFloat(2.0)
    }
    
    func lineChartView(lineChartView: JBLineChartView!, verticalSelectionColorForLineAtLineIndex lineIndex: UInt) -> UIColor! {
        return UIColor.whiteColor()
    }
    
    func lineChartView(lineChartView: JBLineChartView!, selectionColorForLineAtLineIndex lineIndex: UInt) -> UIColor! {
        if lineIndex == 0 {
            return UIColor(hexString: "#6633CC", alpha: 0.8)
        }
        return UIColor(hexString: "#990099", alpha: 0.8)
    }
    
    func lineChartView(lineChartView: JBLineChartView!, selectionFillColorForLineAtLineIndex lineIndex: UInt) -> UIColor! {
        if lineIndex == 0 {
            return UIColor(hexString: "#6633CC", alpha: 0.8)
        }
        return UIColor(hexString: "#990099", alpha: 0.8)
    }
    
    func lineChartView(lineChartView: JBLineChartView!, selectionColorForDotAtHorizontalIndex horizontalIndex: UInt, atLineIndex lineIndex: UInt) -> UIColor! {
        if lineIndex == 0 {
            return UIColor(hexString: "#6633CC", alpha: 0.8)
        }
        return UIColor(hexString: "#990099", alpha: 0.8)
    }
    
    func lineChartView(lineChartView: JBLineChartView!, lineStyleForLineAtLineIndex lineIndex: UInt) -> JBLineChartViewLineStyle {
        return JBLineChartViewLineStyle.Solid
    }
}










