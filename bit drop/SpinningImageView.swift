//
//  SpinningImageView.swift
//  bit drop
//
//  Created by Andrew Breckenridge on 8/22/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit

class SpinningImageView: UIImageView {
    var spinningOptions: UIViewAnimationOptions?
    
    var spinning = false {
        didSet {
            self.spin()
        }
    }
    
    private func spin() {
        UIView.animateWithDuration(0.5, delay: 0, options: spinningOptions ?? .CurveLinear, animations: {
            self.transform = CGAffineTransformRotate(self.transform, CGFloat(M_PI))
        }, completion: {
            print($0)
            if self.spinning {
                self.spin()
            }
        })
        
    }
    
}
