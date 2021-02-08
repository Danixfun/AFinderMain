//
//  AFSecondaryCircularButton.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//

import Foundation
import UIKit

class AFSecondaryCircularButton: UIButton {
    
    // MARK: Properties
    private var edge: CGFloat = 10
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.sharedSetup()
    }
    
    init(icon: String, frame: CGRect = .zero){
        super.init(frame: frame)
        self.setQuick(icon: icon)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.sharedSetup()
    }
    
    //MARK: Private Functions
    private func sharedSetup(){
        contentHorizontalAlignment = .fill
        contentVerticalAlignment = .fill
        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = UIEdgeInsets(top: edge, left: edge, bottom: edge, right: edge)
        tintColor = UIColor(named: "SecondaryButtonTextColor")
        backgroundColor = UIColor(named: "SecondaryCircularBackgroundColor")
        setTitleColor(UIColor(named: "SecondaryButtonTextColor"), for: .normal)
        titleLabel?.font = FontHelper.shared.primaryButton
        layer.cornerRadius = 0.5 * bounds.size.width
        layer.masksToBounds = true
    }
    
    //MARK: - API
    func setQuick(icon:String) {
        let radiusIcon = UIImage(named: icon)
        setImage(radiusIcon, for: .normal)
    }
}
