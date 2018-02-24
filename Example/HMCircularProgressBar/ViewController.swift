//
//  ViewController.swift
//  HMCircularProgressBar
//
//  Created by Hatim Makki on 02/22/2018.
//  Copyright (c) 2018 Hatim Makki. All rights reserved.

import UIKit
import HMCircularProgressBar

class ViewController: UIViewController {
    
    @IBOutlet var progress: CircularProgressView!
    @IBOutlet var slider: UISlider!
    @IBOutlet var slider2: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progress.progress = 0.5
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        progress.progress = CGFloat(slider.value)
    }
    @IBAction func slider2Changed(_ sender: Any) {
        progress.barThickness = CGFloat(slider2.value * 3)

    }
}
