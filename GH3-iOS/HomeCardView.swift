//
//  HomeCardView.swift
//  GH3-iOS
//
//  Created by Li Zeng on 12/6/14.
//  Copyright (c) 2014 CarlorClub. All rights reserved.
//

import Foundation
import UIKit

class HomeCardView: UIView {
    
    var sensiControl: UISegmentedControl?
    var sensiStatusControl: UISegmentedControl?
    
    var sensiAlphaBatteryView: UIImageView?
    var sensiBetaBatterView: UIImageView?
    
    var homeBtn: UIImageView?
    var settingsBtn: UIImageView?
    var peopleBtn: UIImageView?
    var infoBtn: UIImageView?
    
    var alertLabel: UILabel?
    
    required init(coder aDecoder: NSCoder) {
        sensiControl = nil
        sensiStatusControl = nil
        sensiAlphaBatteryView = nil
        sensiBetaBatterView = nil
        homeBtn = nil
        settingsBtn = nil
        peopleBtn = nil
        infoBtn = nil
        alertLabel = nil
        super.init(coder: aDecoder)
    }
    
    required override init(frame: CGRect) {
        sensiControl = nil
        sensiStatusControl = nil
        sensiAlphaBatteryView = nil
        sensiBetaBatterView = nil
        homeBtn = nil
        settingsBtn = nil
        peopleBtn = nil
        infoBtn = nil
        alertLabel = nil
        super.init(frame: frame)
        
    }

    func setupUI() {
        
        self.backgroundColor = UIColor(hexString: "#55CAF7", alpha: 0.8)
        self.layer.shadowColor = UIColor.grayColor().CGColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 2.0
        self.layer.cornerRadius = 8.0
        
        var sensiControlItems: NSArray = NSArray(objects: "Bed Room", "Living Room")
        var sensiStatusItems: NSArray = NSArray(objects: "Heat", "Cool", "Auto", "Fan Only")
        
        sensiControl = UISegmentedControl(items: sensiControlItems)
        sensiStatusControl = UISegmentedControl(items: sensiStatusItems)
        sensiControl?.frame = CGRectMake(10, 20, self.frame.width-20, 40)
        sensiStatusControl?.frame = CGRectMake(10, 100, self.frame.width-20, 40)
        
        sensiControl?.tintColor = UIColor.whiteColor()
        sensiStatusControl?.tintColor = UIColor.whiteColor()
        
        sensiAlphaBatteryView = UIImageView(frame: CGRectMake(40, 65, 60, 30))
        sensiBetaBatterView = UIImageView(frame: CGRectMake(150, 65, 60, 30))
        sensiAlphaBatteryView?.image = UIImage(named: "Battery-Meter-50-Percent")
        sensiBetaBatterView?.image = UIImage(named: "Battery-Meter-75-Percent")
        
        homeBtn = UIImageView(frame: CGRectMake(15, self.frame.height-70, 40, 40))
        settingsBtn = UIImageView(frame: CGRectMake(75, self.frame.height-70, 40, 40))
        peopleBtn = UIImageView(frame: CGRectMake(135, self.frame.height-70, 40, 40))
        infoBtn = UIImageView(frame: CGRectMake(195, self.frame.height-70, 40, 40))
        
        homeBtn?.image = UIImage(named: "ICON-Home")
        settingsBtn?.image = UIImage(named: "ICON-Gear")
        peopleBtn?.image = UIImage(named: "ICON-Users")
        infoBtn?.image = UIImage(named: "ICON-Info")
        
        self.addSubview(sensiAlphaBatteryView!)
        self.addSubview(sensiBetaBatterView!)
        self.addSubview(sensiControl!)
        self.addSubview(sensiStatusControl!)
        self.addSubview(homeBtn!)
        self.addSubview(settingsBtn!)
        self.addSubview(peopleBtn!)
        self.addSubview(infoBtn!)
    }
    
}
























