//
//  StopWatchView.swift
//  UsabilityLogger
//
//  Created by Kasper Schultz Davidsen on 03/04/2019.
//  Copyright © 2019 Kasper Schultz Davidsen. All rights reserved.
//

import UIKit

@IBDesignable class StopWatchView: UIView {

    private var timer: Timer?
    private var start: DispatchTime?
    private var now: DispatchTime?
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBAction func startAction(_ sender: UIButton) {
        startButton.isEnabled = false
        startButton.alpha = 0.5
        stopButton.isEnabled = true
        stopButton.alpha = 1
        timerLabel.text = "0"
        
        start = DispatchTime.now()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimerLabel), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopAction(_ sender: Any) {
        timer?.invalidate()
        
        startButton.isEnabled = true
        startButton.alpha = 1
        stopButton.isEnabled = false
        stopButton.alpha = 0.5
    }
    
    @objc private func updateTimerLabel() {
        now = DispatchTime.now()
        
        if let start = start {
            let elapsedNanos = now!.uptimeNanoseconds - start.uptimeNanoseconds
            let elapsedSeconds = elapsedNanos / 1_000_000_000
            timerLabel.text = String(elapsedSeconds)
        }
    }
    
    deinit {
        timer?.invalidate()
    }
    
    func reset() {
        timer?.invalidate()
        timerLabel.text = "0"
        
        startButton.isEnabled = true
        startButton.alpha = 1
        stopButton.isEnabled = false
        stopButton.alpha = 0.5
    }
    
    //MARK: XIB Boilerplate
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromXib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromXib()
    }
    
    private func setupFromXib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        
        self.backgroundColor = .clear
        
        stopButton.alpha = 0.5
    }
}
