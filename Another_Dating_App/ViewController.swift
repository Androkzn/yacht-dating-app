//
//  ViewController.swift
//  Another_Dating_App
//
//  Created by Andrei Tekhtelev on 2020-05-04.
//  Copyright © 2020 HomeDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var settingButtonOutlet: UIButton!
    @IBOutlet weak var seetingsView: UIView!
    @IBOutlet weak var centerView: UIStackView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var likeButtonOutlet: UIButton!
    @IBOutlet weak var dislikeButtonOutlet: UIButton!
    @IBOutlet weak var reactionImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func settingsButton(_ sender: Any) {
        seetingsView.isHidden = false
    }
    

    @IBAction func darkModeToogle(_ sender: UISwitch) {
        if sender.isOn {
            mainView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            mainLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            likeButtonOutlet.tintColor = #colorLiteral(red: 0.04327359796, green: 0.1777401567, blue: 0.3175832033, alpha: 1)
            dislikeButtonOutlet.tintColor = #colorLiteral(red: 0.04327359796, green: 0.1777401567, blue: 0.3175832033, alpha: 1)
                        settingButtonOutlet.setImage(UIImage (named: "wheel60white"), for: .normal)
            
        } else {
            mainView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            mainLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            likeButtonOutlet.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            dislikeButtonOutlet.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            settingButtonOutlet.setImage(UIImage (named: "wheel60dark"), for: .normal)
            
        }
    }
    
    @IBAction func fontSizeSlider(_ sender: UISlider) {
        let fontSize = sender.value
        mainLabel.font = mainLabel.font.withSize(CGFloat(fontSize))
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        seetingsView.isHidden = true
    }
    
    
//    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
//        centerView.transform = CGAffineTransform (scaleX: 1.1, y: 1.1)
//           let location = sender.location(in: centerView)
//            centerView.frame.origin.x += location.x
//
//    }
//    @IBAction func leftSwipe(_ sender: UISwipeGestureRecognizer) {
//        centerView.transform = CGAffineTransform (scaleX: 1.1, y: 1.1)
//           let location = sender.location(in: centerView)
//            centerView.frame.origin.x += location.x
//    }
    
    @IBAction func panGestureCenterView(_ sender: UIPanGestureRecognizer) {
    
        let card = sender.view!
        let location = sender.translation(in: centerView)
        let xFromCenter = card.center.x - view.center.x
        
        card.center = CGPoint (x: view.center.x + location.x, y: view.center.y + location.y)
        if xFromCenter > 0 {
            reactionImage.image = UIImage (named: "heart100")
            reactionImage.tintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        
        } else {
            reactionImage.image = UIImage (named: "jollyroger100")
            reactionImage.tintColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        }
        
        reactionImage.alpha = abs(xFromCenter) / view.center.x
         
        
        if sender.state == UIGestureRecognizer.State.ended {
            if card.center.x < 30 {
                UIView.animate(withDuration: 0.5, animations: {
                    card.center = CGPoint (x: card.center.x - 300, y: card.center.y)
                    card.alpha = 0
                    self.reactionImage.alpha = 0
                    
                })
                return
            } else if card.center.x > (view.frame.width - 30) {
                UIView.animate(withDuration: 0.5, animations: {
                    card.center = CGPoint (x: card.center.x + 300, y: card.center.y)
                    card.alpha = 0
                    self.reactionImage.alpha = 0
                  })
                return
            }
            UIView.animate(withDuration: 0.3, animations: {
                card.center = self.view.center
                self.reactionImage.alpha = 0
            })
        }
    }
    
    func rightAnimation (){
    
    }
    
    func leftAnimation () {
        
    }

    
    @IBAction func likeButton(_ sender: UIButton) {
        reactionImage.alpha = 1
        reactionImage.tintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        reactionImage.image = UIImage (named: "heart100")
        print(centerView.center)
        UIView.animate(withDuration: 2, animations: {
            self.centerView.center = CGPoint (x: self.view.center.x-300, y: self.view.center.y)
            print(self.centerView.center)
            self.reactionImage.alpha = 0
            self.centerView.alpha = 0
        })
        
    }
    
    @IBAction func dislikeButton(_ sender: UIButton) {
        centerView.alpha = 1
    }

}

