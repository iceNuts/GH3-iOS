//
//  DisplayCardView.swift
//  GH3-iOS
//
//  Created by Li Zeng on 12/6/14.
//  Copyright (c) 2014 CarlorClub. All rights reserved.
//

import Foundation
import UIKit

class DisplayCardView: UIView {
    
    var cardTitleLabel: UILabel?
    var temperatureLabel: UILabel?
    var humidityLabel: UILabel?
    
    required init(coder aDecoder: NSCoder) {
        cardTitleLabel = nil
        temperatureLabel = nil
        humidityLabel = nil
        super.init(coder: aDecoder)
    }
    
    required override init(frame: CGRect) {
        cardTitleLabel = nil
        temperatureLabel = nil
        humidityLabel = nil
        super.init(frame: frame)
        
    }
    
    func setupUI() {
        
        self.backgroundColor = UIColor(hexString: "#FF0066", alpha: 0.8)
        self.layer.shadowColor = UIColor.grayColor().CGColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 2.0
        self.layer.cornerRadius = 8.0
        
        // Layout
        
        cardTitleLabel = UILabel(frame: CGRectMake(20, 10, self.frame.width-40, 30))
        temperatureLabel = UILabel(frame: CGRectMake(40, 45, 100, 200))
        humidityLabel = UILabel(frame: CGRectMake(self.frame.width-120, self.frame.height-100, 120, 100))
        
        // Render
        
        var cardTitleString: NSMutableAttributedString = NSMutableAttributedString(string: "    Room Temperature")
        cardTitleString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSMakeRange(0, cardTitleString.length))
        cardTitleString.addAttribute(NSFontAttributeName, value: UIFont(name: "Helvetica-Light", size: 20)!, range: NSMakeRange(0, cardTitleString.length))
        cardTitleLabel?.attributedText = cardTitleString
        
        var temperatureString: NSMutableAttributedString = NSMutableAttributedString(string: "75°")
        temperatureString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSMakeRange(0, temperatureString.length))
        temperatureString.addAttribute(NSFontAttributeName, value: UIFont(name: "Helvetica-Bold", size: 80)!, range: NSMakeRange(0, temperatureString.length))
        temperatureLabel?.attributedText = temperatureString
        temperatureLabel?.sizeToFit()
        
        var humidityString: NSMutableAttributedString = NSMutableAttributedString(string: "Humidity\n40%")
        humidityString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSMakeRange(0, humidityString.length))
        humidityString.addAttribute(NSFontAttributeName, value: UIFont(name: "Helvetica-Bold", size: 40)!, range: NSMakeRange(0, humidityString.length))
        humidityString.addAttribute(NSFontAttributeName, value: UIFont(name: "Helvetica-Light", size: 20)!, range: NSMakeRange(0, 8))
        humidityLabel?.numberOfLines = 2
        humidityLabel?.attributedText = humidityString
        humidityLabel?.sizeToFit()
        
        self.addSubview(cardTitleLabel!)
        self.addSubview(temperatureLabel!)
        self.addSubview(humidityLabel!)
    }
    
}




