//
//  WelcomeViewController.swift
//  bit drop
//
//  Created by Andrew Breckenridge on 8/22/15.
//  Copyright © 2015 Andrew Breckenridge. All rights reserved.
//

import UIKit
import QuartzCore

class WelcomeViewController: UIViewController {

    @IBOutlet weak var coinImageView: SpinningImageView!
    @IBOutlet weak var slotImageView: UIImageView!
    @IBOutlet weak var boundaryView: UIView!
    @IBOutlet weak var heroLabel: UILabel!
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        coinImageView.frame..center = CGPoint(x: view.center.x, y: coinImageView.center.y)
        
        self.heroLabel.font = UIFont(name: "8BIT WONDER Nominal", size: 32)!
        
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior(items: [coinImageView])
        collision = UICollisionBehavior(items: [coinImageView, boundaryView])
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.collisionDelegate = self
        
        delay(0.0000000001) {
            self.animator.addBehavior(self.gravity)
            self.animator.addBehavior(self.collision)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WelcomeViewController: UICollisionBehaviorDelegate {
    func collisionBehavior(behavior: UICollisionBehavior, beganContactForItem item1: UIDynamicItem, withItem item2: UIDynamicItem, atPoint p: CGPoint) {
        self.collision.removeItem(boundaryView)
        self.collision.removeItem(coinImageView)
        
        delay(1) {
            self.heroLabel.hidden = false
            delay(0.001) {
                self.heroLabel.hidden = true
                delay(0.0001) {
                    self.heroLabel.hidden = false
                    delay(0.01) {
                        self.heroLabel.hidden = true
                        delay(0.00001) {
                            self.heroLabel.hidden = false
                        }
                    }
                }
            }
        }
    }
}
