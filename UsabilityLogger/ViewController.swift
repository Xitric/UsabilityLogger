//
//  ViewController.swift
//  UsabilityLogger
//
//  Created by Kasper Schultz Davidsen on 03/04/2019.
//  Copyright © 2019 Kasper Schultz Davidsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var counters: [CounterView]!
    @IBOutlet weak var stopWatch: StopWatchView!
    
    @IBAction func resetAction(_ sender: Any) {
        for counter in counters {
            counter.reset()
        }
        stopWatch.reset()
    }
}

