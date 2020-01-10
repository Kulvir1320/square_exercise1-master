//
//  ViewController.swift
//  exercise1
//
//  Created by MacStudent on 2020-01-09.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var box: UIImageView!
    let heightOfscreen = UIScreen.main.bounds.size.height
    let widthOfScreen = UIScreen.main.bounds.size.width
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        box.frame.origin.x = 0
        box.frame.origin.y  = 0
        let time = heightOfscreen / 150
        
      
        UIView.animate(withDuration: TimeInterval(time)) {
            self.box.frame.origin.y = self.heightOfscreen - self.box.frame.height
        }
        
        //swipe function
      
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
              swipeRight.direction = UISwipeGestureRecognizer.Direction.right
              view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
               swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
               view.addGestureRecognizer(swipeLeft)
    }
    
    
    
    @objc func swiped(gesture: UISwipeGestureRecognizer) {
           let swipeGesture = gesture as UISwipeGestureRecognizer
       
             

        switch swipeGesture.direction {
        case UISwipeGestureRecognizer.Direction.right:
           clockwise()
       case UISwipeGestureRecognizer.Direction.left:
            anticlockwise()
        default:
            break
        }
          
    }
    func clockwise() {
        UIView.animate(withDuration: 2, animations: {
             self.box.frame.origin.x = self.widthOfScreen - self.box.frame.width
        }) { (true) in
            UIView.animate(withDuration: 2, animations: {
                 self.box.frame.origin.y = 0
            }) { (true) in

                UIView.animate(withDuration: 2, animations: {
                    self.box.frame.origin.x = 0
                }) { (true) in
//                    UIView.animate(withDuration: 2, animations:{
//                    self.box.frame.origin.y = self.heightOfscreen - self.box.frame.height
//                    }
                    UIView.animate(withDuration: 2, animations: {
                         self.box.frame.origin.y = self.heightOfscreen - self.box.frame.height
                    }) { (true) in
                        self.anticlockwise()
                    }
                }
            }
        }
    }
    
    func anticlockwise() {
        UIView.animate(withDuration: 2, animations: {
                    self.box.frame.origin.y = 0
                }) { (true) in

                    
                    UIView.animate(withDuration: 2, animations: {
                         self.box.frame.origin.x = self.widthOfScreen - self.box.frame.width
                    }) { (true) in
                        UIView.animate(withDuration: 2, animations: {
                             self.box.frame.origin.y = self.heightOfscreen - self.box.frame.height
                        }) { (true) in
        //                    UIView.animate(withDuration: 2) {
        //                        self.box.frame.origin.x = 0
        //                    }
                            UIView.animate(withDuration: 2, animations: {
                                 self.box.frame.origin.x = 0
                            }) { (true) in
                                self.clockwise()
       
    }


                            }
                        
                    }
}
                        }
}

