//
//  SettingsView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//  
//

import Foundation
import UIKit

class SettingsView: UIViewController {
    
    // MARK: Properties
    var presenter: SettingsPresenterProtocol?
    var exitAreaTapGesture:UITapGestureRecognizer?
    
    // MARK: IBOutlet
    @IBOutlet weak var updateActionButton: AFPrimaryButton!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var rangeValueLabel: UILabel!
    @IBOutlet weak var rangeSlider: UISlider!
    @IBOutlet weak var exitAreaContainer: UIView!
    
    // MARK: IBAction
    @IBAction func updateMapAction(_ sender: Any) {
        self.presenter?.updateMapAction(range: rangeSlider.value)
    }
    
    @IBAction func updateRange(_ sender: UISlider) {
        self.presenter?.updateRange(range: sender.value)
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    
    @objc func dismissView() {
        self.presenter?.dismissView()
    }
    
}

extension SettingsView: SettingsViewProtocol {
    func setUpLabels(){
        self.rangeLabel.text = "Range".localized()
    }
    
    func setUpButtons(){
        self.updateActionButton.setQuick(title: "Update")
    }
    
    func setUpExitAreaView(){
        exitAreaTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        exitAreaContainer.addGestureRecognizer(exitAreaTapGesture!)
    }
    
    func loadCurrentRange(range: Float, rangeText: String){
        self.rangeSlider.minimumValue = Float(RadiusRangeValues.min)
        self.rangeSlider.maximumValue = Float(RadiusRangeValues.max)
        self.rangeSlider.value = range
        self.rangeValueLabel.text = rangeText
    }
    
    func updateRangeLabel(rangeText: String){
        self.rangeValueLabel.text = rangeText
    }
}
