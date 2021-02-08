//
//  AFSecondaryButton.swift
//  AFinder
//
//  Created by Daniel Tejeda on 06/02/21.
//

import UIKit

class AFSecondaryButton: UIButton {

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sharedSetup()
    }
    
    init(title: String, frame: CGRect = .zero){
        super.init(frame: frame)
        self.setQuick(title: title)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.sharedSetup()
    }
    
    // MARK: Private Functions
    private func sharedSetup(){
        backgroundColor = UIColor(named: "SecondaryButtonBackgroundColor")
        setTitleColor(UIColor(named: "SecondaryButtonTextColor"), for: .normal)
        titleLabel?.font = FontHelper.shared.secondaryButton
        layer.cornerRadius = 8.0
        layer.borderWidth = 2.0
        layer.borderColor = UIColor(named: "SecondaryButtonBorderLineColor")?.cgColor
        layer.masksToBounds = true
        tintColor = UIColor(named: "SecondaryButtonTextColor")
    }
    
    // MARK: API
    func setQuick(title:String) {
        setTitle(title.localized(), for: .normal)
    }
    
    // MARK Notifications
    /// For some reason, cgColors do not change automatically between light and dark mode, so we must do it manually
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        layer.borderColor = UIColor(named: "SecondaryButtonBorderLineColor")?.cgColor
    }
    
}
