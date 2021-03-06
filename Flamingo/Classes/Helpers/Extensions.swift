//
//  Extensions.swift
//  Flamingo
//
//  Created by Alexis Creuzot on 30/01/2018.
//  Copyright © 2018 alexiscreuzot. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var wordCount : Int {
        let words = self.components(separatedBy: .whitespacesAndNewlines)
        return words.count
    }
    
    var tagless : String {
        var words = self.components(separatedBy: .whitespacesAndNewlines)
        words = words.filter { string -> Bool in
            return !(string.contains("<") && (string.contains(">")))
        }
        return words.joined(separator: " ")
    }
}

extension Array {
    mutating func rearrange(from: Int, to: Int) {
        precondition(indices.contains(from) && indices.contains(to), "invalid indexes")
        insert(remove(at: from), at: to)
    }
}

extension CGFloat {
    var goldenRatio : (long: CGFloat, short:CGFloat) {
        let long = self / CGFloat(1.618)
        let short = self - long
        return (long, short)
    }
}

extension UIImage {
    func blend(image : UIImage, with blendMode:CGBlendMode) -> UIImage {

        UIGraphicsBeginImageContext(self.size)
        self.draw(at:  CGPoint.zero)
        image.draw(in: CGRect(origin: CGPoint.zero, size: self.size), blendMode: blendMode, alpha: 0.9)
        let result: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result ?? UIImage()
    }
}
