//
//  ImageScale.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//

import Foundation
import UIKit

func scaleImage(imageName: String) -> UIImage {
    let pinImage = UIImage(named: imageName)
    let size = CGSize(width: 70, height: 70)
    UIGraphicsBeginImageContext(size)
    pinImage!.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    return UIGraphicsGetImageFromCurrentImageContext()!
}
