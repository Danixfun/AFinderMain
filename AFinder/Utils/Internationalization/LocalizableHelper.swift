//
//  LocalizableHelper.swift
//  AFinder
//
//  Created by Daniel Tejeda on 06/02/21.
//

import Foundation

/// Easy to use function to handle internationalization strings
extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
