//
//  ControlCardView.swift
//  GH3-iOS
//
//  Created by Li Zeng on 12/6/14.
//  Copyright (c) 2014 CarlorClub. All rights reserved.
//

import Foundation
import UIKit

class ControlCardView: UIView {
    
    var upBtn: UIImageView?
    var temperatureLabel: UILabel?
    var downBtn: UIImageView?
    
    required init(coder aDecoder: NSCoder) {
        upBtn = nil
        temperatureLabel = nil
        downBtn = nil
        super.init(coder: aDecoder)
    }
    
    required override init(frame: CGRect) {
        upBtn = nil
        temperatureLabel = nil
        downBtn = nil
        super.init(frame: frame)
        
    }
    
    func setupUI() {
        
        // Layout
        
        self.backgroundColor = UIColor(hexString: "#F5BC4F", alpha: 0.8)
        self.layer.shadowColor = UIColor.grayColor().CGColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 2.0
        self.layer.cornerRadius = 8.0

        upBtn = UIImageView(frame: CGRectMake(95, 10, 60, 60))
        upBtn?.image = UIImage(named: "Arrow-Button-Up")
        
        downBtn = UIImageView(frame: CGRectMake(95, self.frame.height-70, 60, 60))
        downBtn?.image = UIImage(named: "Arrow-Button-Down")
        
        temperatureLabel = UILabel(frame: CGRectMake(95, 100, 150, 150))
        
        // Render
        
        self.addSubview(upBtn!)
        self.addSubview(temperatureLabel!)
        self.addSubview(downBtn!)
        
        self.userInteractionEnabled = true
        upBtn?.userInteractionEnabled = true
        downBtn?.userInteractionEnabled = true
        
    }
    
    func updateTemperature(temperature: Int) {
        var temperatureString: NSMutableAttributedString = NSMutableAttributedString(string: String(temperature)+"°")
        temperatureString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSMakeRange(0, temperatureString.length))
        temperatureString.addAttribute(NSFontAttributeName, value: UIFont(name: "Helvetica-Bold", size: 50)!, range: NSMakeRange(0, temperatureString.length))
        temperatureLabel?.attributedText = temperatureString
        temperatureLabel?.sizeToFit()
    }
    
}