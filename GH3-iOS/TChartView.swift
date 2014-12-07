//
//  TChartView.swift
//  GH3-iOS
//
//  Created by Li Zeng on 12/7/14.
//  Copyright (c) 2014 CarlorClub. All rights reserved.
//

import Foundation

class TCharView: UIView {
    
    var lineChartView: JBLineChartView!
    
    var titleBar: UIView!
    var cardViewTitle: UILabel!
    var cardViewTitleIndicator: UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func setupUI(cardTitle: String, indicatorImageString: String) {
        // Layout
        
        titleBar = UIView(frame: CGRectMake(0, 0, self.frame.width, 60))
        cardViewTitle = UILabel(frame: CGRectMake(80, 15, 150, 30))
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
        
        // T Chart Setup
        lineChartView = JBLineChartView(frame: CGRectMake(0, 70, self.frame.width, self.frame.height-70))
        
        self.addSubview(titleBar)
        self.addSubview(lineChartView)
        titleBar.addSubview(cardViewTitle)
        titleBar.addSubview(cardViewTitleIndicator)

        self.userInteractionEnabled = true
        lineChartView.userInteractionEnabled = true
    }
    
    func setupChartView(timeSymbols: NSMutableArray) {
       
    }
    
}









