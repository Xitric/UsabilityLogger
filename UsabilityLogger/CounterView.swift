//
//  CounterView.swift
//  UsabilityLogger
//
//  Created by Kasper Schultz Davidsen on 03/04/2019.
//  Copyright © 2019 Kasper Schultz Davidsen. All rights reserved.
//

import UIKit

@IBDesignable class CounterView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var correctCounterLabel: UILabel!
    @IBOutlet weak var correctStepper: UIStepper!
    @IBOutlet weak var incorrectCounterLabel: UILabel!
    @IBOutlet weak var incorrectStepper: UIStepper!
    
    @IBInspectable var title: String! {
        set {
            titleLabel.text = newValue
        }
        get {
            return titleLabel.text ?? ""
        }
    }
    
    @IBAction func correctStepAction(_ sender: UIStepper) {
        correctCounterLabel.text = String(Int(sender.value))
    }
    
    @IBAction func incorrectStepAction(_ sender: UIStepper) {
        incorrectCounterLabel.text = String(Int(sender.value))
    }
    
    func reset() {
        correctStepper.value = 0
        correctCounterLabel.text = "0"
        incorrectStepper.value = 0
        incorrectCounterLabel.text = "0"
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
    }
}
