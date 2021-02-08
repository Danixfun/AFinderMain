//
//  AFPrimaryButton.swift
//  AFinder
//
//  Created by Daniel Tejeda on 06/02/21.
//

import UIKit

class AFPrimaryButton: UIButton {

    //MARK: Init
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
    
    //MARK: Private Functions
    private func sharedSetup(){
        backgroundColor = UIColor(named: "PrimaryButtonBackgroundColor")
        setTitleColor(UIColor(named: "PrimaryButtonTextColor"), for: .normal)
        titleLabel?.font = FontHelper.shared.primaryButton
        layer.cornerRadius = 8.0
        layer.masksToBounds = true
        tintColor = UIColor(named: "PrimaryButtonTextColor")
    }
    
    //MARK: - API
    func setQuick(title:String) {
        setTitle(title.localized(), for: .normal)
    }
    
}
