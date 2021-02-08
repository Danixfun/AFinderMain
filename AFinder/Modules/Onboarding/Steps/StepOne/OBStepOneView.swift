//
//  OBStepOneView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit
import Lottie

class OBStepOneView: UIViewController, OnboardingStepProtocol {

    // MARK: IBOutlet
    @IBOutlet weak var animationContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var disclaimerLabel: UILabel!
    @IBOutlet weak var stepOneButton: AFPrimaryButton!
    @IBOutlet weak var backButton: AFSecondaryButton!
    
    // MARK: IBAction
    @IBAction func gpsPermissionAction(_ sender: Any) {
        self.presenter?.requestGPSPermission()
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.presenter?.backButtonAction()
    }
    
    // MARK: Properties
    var presenter: OBStepOnePresenterProtocol?
    var index: Int = 0

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        self.presenter?.viewDidLayoutSubviews()
    }
}

extension OBStepOneView: OBStepOneViewProtocol {
    // TODO: implement view output methods
    
    func setUpLabels() {
        titleLabel.text = "Permission".localized()
        messageLabel.text = "Permission message".localized()
        disclaimerLabel.text = "Permission disclaimer".localized()
    }
    
    func setUpButtons() {
        self.backButton.setQuick(title: "Back")
        self.stepOneButton.setQuick(title: "Grant")
    }
    
    func setUpAnimation() {
        AnimationWrapper.setUpAnimation(in: self.animationContainer, withFile: "gps_permission")
    }
    
    func handleGPSPermissionReponse(success: Bool) {
        if success {
            self.presenter?.nextStep()
        }
        else {
            self.titleLabel.text = "Oh no permission".localized()
            self.messageLabel.text = "It happens".localized()
            self.disclaimerLabel.isHidden = true
            self.stepOneButton.setQuick(title: "Open settings")
            AnimationWrapper.setUpAnimation(in: self.animationContainer, withFile: "no_gps", repeatMode: 1)
        }
    }
}
