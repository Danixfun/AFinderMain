//
//  OBStepTwoView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit

class OBStepTwoView: UIViewController, OnboardingStepProtocol {
    
    // MARK: Properties
    var presenter: OBStepTwoPresenterProtocol?
    var index: Int = 0
    var rangeCircle = RangeCircleView()
    var currentRange: Int = RadiusRangeValues.defaultValue
    let minRange: Int = RadiusRangeValues.min
    let maxRange: Int = RadiusRangeValues.max
    var currentRangeString: String {
        if currentRange == 1 {
            return "\(currentRange) km"
        }
        return "\(currentRange) kms"
    }
    
    // MARK: IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var rangeAnalogyView: UIView!
    @IBOutlet weak var rangeSlider: UISlider!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var nextButton: AFPrimaryButton!
    
    // MARK: IBAction
    @IBAction func rangeDidChange(_ sender: Any) {
        self.presenter?.rangeDidChange(sender: sender as! UISlider)
    }
    
    @IBAction func nextAction(_ sender: Any) {
        self.presenter?.nextStep(range: currentRange)
    }
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.presenter?.viewDidLayoutSubviews()
    }
}

extension OBStepTwoView: OBStepTwoViewProtocol {
    // TODO: implement view output methods
    func setUpLabels() {
        self.titleLabel.text = "Set a range".localized()
        self.subtitleLabel.text = "Set a range later".localized()
    }
    
    func setUpButtons() {
        self.nextButton.setQuick(title: "Next")
    }
    
    func setUpRangeCircleView() {
        rangeCircle = RangeCircleView(frame: rangeAnalogyView.bounds, circleRadius: CGFloat(currentRange))
        rangeAnalogyView.addSubview(rangeCircle)
        rangeCircle.setNeedsDisplay()
    }
    
    func loadCurrentRange() {
        rangeSlider.minimumValue = Float(minRange)
        rangeSlider.maximumValue = Float(maxRange)
        rangeSlider.value = Float(currentRange)
        self.rangeLabel.text = currentRangeString
    }
    
    func updateRangeView(km: Int, circleRadius: CGFloat) {
        self.currentRange = km
        self.rangeLabel.text = currentRangeString
        self.rangeCircle.circleRadius = circleRadius
    }
}
