//
//  StatsCardView.swift
//  GH3-iOS
//
//  Created by Li Zeng on 12/6/14.
//  Copyright (c) 2014 CarlorClub. All rights reserved.
//

import Foundation
import UIKit

class StatsCardView: UIView {

    var titleBar: UIView!
    var circleView: CircleView!
    var circleViewLabel: UILabel!
    var timer: NSTimer?
    var progress: Int
    var cardViewTitle: UILabel!
    var cardViewTitleIndicator: UIImageView!
    var finalDisplayProgress: Float
    
    var weatherIcon: UIImageView?
    var temperatureLabel: UILabel?
    var humidityLabel: UILabel?
    
    required init(coder aDecoder: NSCoder) {
        self.timer = nil
        self.progress = 0
        self.weatherIcon = nil
        self.temperatureLabel = nil
        self.humidityLabel = nil
        self.finalDisplayProgress = 0.8
        super.init(coder: aDecoder)
    }
    
    required override init(frame: CGRect) {
        self.timer = nil
        self.progress = 0
        self.weatherIcon = nil
        self.temperatureLabel = nil
        self.humidityLabel = nil
        self.finalDisplayProgress = 0.8
        super.init(frame: frame)
        
    }
    
    func setupUI(cardTitle: String, indicatorImageString: String) {
        
        // Layout
        
        titleBar = UIView(frame: CGRectMake(0, 0, self.frame.width, 60))
        cardViewTitle = UILabel(frame: CGRectMake(80, 15, 100, 30))
        cardViewTitleIndicator = UIImageView(frame: CGRectMake(10, 15, 30, 30))
        cardViewTitleIndicator.image = UIImage(named: indicatorImageString)
        
        // Rendering
        
        self.backgroundColor = UIColor(hexString: "#606060", alpha: 0.6)
        titleBar.backgroundColor = UIColor(hexString: "#505050", alpha: 0.8)
        var cardTitleString: NSMutableAttributedString = NSMutableAttributedString(string: cardTitle)
        cardTitleString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSMakeRange(0, cardTitleString.length))
        cardTitleString.addAttribute(NSFontAttributeName, value: UIFont(name: "Helvetica-Light", size: 20)!, range: NSMakeRange(0, cardTitleString.length))
        cardViewTitle.attributedText = cardTitleString
        self.layer.cornerRadius = 10.0
        
        self.addSubview(titleBar)
        titleBar.addSubview(cardViewTitle)
        titleBar.addSubview(cardViewTitleIndicator)
        
        var singleFingerTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "scaleAnimate")
        self.addGestureRecognizer(singleFingerTap)
        
    }
    
    func setupSavingsDisplay() {
        circleView = CircleView(frame: CGRectMake(25, 80, 250, 250))
        circleView.strokeColor = UIColor.customGreenColor()
        self.addSubview(circleView)
        circleViewLabel = UILabel(frame: CGRectMake(120, 180, 100, 60))
        self.addSubview(circleViewLabel)
        
        circleView.setStrokeEnd(0.0, animated: false)
        
        var circleViewString: NSMutableAttributedString = NSMutableAttributedString(string: "$0.0")
        circleViewString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSMakeRange(0, circleViewString.length))
        circleViewString.addAttribute(NSFontAttributeName, value: UIFont(name: "Helvetica-Light", size: 25)!, range: NSMakeRange(0, circleViewString.length))
        circleViewLabel.attributedText = circleViewString
        
    }
    
    func scaleAnimate() {
        var scaleAnimation: POPSpringAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation.velocity = NSValue(CGSize: CGSizeMake(3.0, 3.0))
        scaleAnimation.toValue = NSValue(CGSize: CGSizeMake(1.0, 1.0))
        scaleAnimation.springBounciness = 18.0
        self.layer .pop_addAnimation(scaleAnimation, forKey: "layerScaleSpringAnimation")
    }
    
    func showSavingAnimation() {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "runInitialSavingFigure", userInfo: nil, repeats: true)
    }
    
    func updateSavingFigure(flag: Bool) {
        if flag {
            progress += Int(arc4random()%10)
            let offset = Float(Int(arc4random()%30))/Float(1000)
            finalDisplayProgress += offset
        }
        else {
            progress -= Int(arc4random()%10)
            let offset = Float(Int(arc4random()%30))/Float(1000)
            finalDisplayProgress -= offset
        }
        var circleViewString: NSMutableAttributedString = NSMutableAttributedString(string: "$"+String(progress))
        circleViewString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSMakeRange(0, circleViewString.length))
        circleViewString.addAttribute(NSFontAttributeName, value: UIFont(name: "Helvetica-Light", size: 25)!, range: NSMakeRange(0, circleViewString.length))
        circleViewLabel.attributedText = circleViewString
        circleView.setStrokeEnd(CGFloat(finalDisplayProgress), animated: false)
        
    }
    
    func runInitialSavingFigure() {
        let total = 480
        var circleViewString: NSMutableAttributedString = NSMutableAttributedString(string: "$"+String(progress))
        circleViewString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSMakeRange(0, circleViewString.length))
        circleViewString.addAttribute(NSFontAttributeName, value: UIFont(name: "Helvetica-Light", size: 25)!, range: NSMakeRange(0, circleViewString.length))
        circleViewLabel.attributedText = circleViewString
        let displayProgress = CGFloat(0.8*(Float(progress)/Float(total)))
        circleView.setStrokeEnd(displayProgress, animated: false)
        
        if progress >= total{
            timer!.invalidate()
        }
        
        progress++
    }
    
    func setupWeatherDisplay() {
        
        // Layout
        
        weatherIcon = UIImageView(frame: CGRectMake(80, 120, 160, 160))
        temperatureLabel = UILabel(frame: CGRectMake(200, 70, 100, 40))
        humidityLabel = UILabel(frame: CGRectMake(50, self.frame.height-50, 250, 40))
        
        weatherIcon!.image = UIImage(named: "Weather-Partly-Cloudy")?.makeThumbnailOfSize(CGSizeMake(160, 160))
        
        // Rendering
        
        var temperatureString: NSMutableAttributedString = NSMutableAttributedString(string: "105°")
        temperatureString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSMakeRange(0, temperatureString.length))
        temperatureString.addAttribute(NSFontAttributeName, value: UIFont(name: "Helvetica-Light", size: 25)!, range: NSMakeRange(0, temperatureString.length))
        temperatureLabel?.attributedText = temperatureString

        
        var humidityString: NSMutableAttributedString = NSMutableAttributedString(string: "Humidity  70%")
        humidityString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSMakeRange(0, humidityString.length))
        humidityString.addAttribute(NSFontAttributeName, value: UIFont(name: "Helvetica-Light", size: 30)!, range: NSMakeRange(0, humidityString.length))
        humidityString.addAttribute(NSFontAttributeName, value: UIFont(name: "Helvetica-Light", size: 25)!, range: NSMakeRange(0, 10))
        humidityLabel?.attributedText = humidityString
        
        self.addSubview(temperatureLabel!)
        self.addSubview(humidityLabel!)
        self.addSubview(weatherIcon!)

    }
}






