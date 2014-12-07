//
//  ViewController.swift
//  GH3-iOS
//
//  Created by Li Zeng on 12/6/14.
//  Copyright (c) 2014 CarlorClub. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var backgroundImage: UIImage!
    var weatherCardView: StatsCardView!
    var savingCardView: StatsCardView!
    var roomDisplayCardView: DisplayCardView!
    var controlCardView: ControlCardView
    var homeCardView: HomeCardView
    var background: UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        backgroundImage = UIImage(named: "Back-Blurred")
        background = UIImageView(image: backgroundImage)
        
        weatherCardView = StatsCardView(frame: CGRectMake(400, 20, 300, 350))
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
        
        super.init(nibName: nil, bundle: nil)
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
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        savingCardView.showSavingAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

