//
//  FontHelper.swift
//  AFinder
//
//  Created by Daniel Tejeda on 06/02/21.
//

import UIKit

class FontHelper {
    
    //MARK:  Init
    static let shared = FontHelper()
    private init(){
        primaryButtonTextSize = 16.0
        secondaryButtonTextSize = 14.0
    }
    
    //MARK:  Global constants
    let globalFontName = "Helvetica"
    let primaryButtonTextSize: CGFloat
    let secondaryButtonTextSize: CGFloat
    
    //MARK:  Global fonts
    var primaryButton: UIFont {
        return UIFont(name: globalFontName, size: primaryButtonTextSize)!
    }
    
    var secondaryButton: UIFont {
        return UIFont(name: globalFontName, size: secondaryButtonTextSize)!
    }
    
}
