//
//  ViewController.swift
//  UsTwo
//
//  Created by Irina Ernst on 9/16/16.
//  Copyright © 2016 Irina Ernst. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myProfileImageView: UIImageView!
    @IBOutlet weak var linkedInImageView: UIImageView!
    @IBOutlet weak var githubImageView: UIImageView!
    @IBOutlet weak var facebookImageView: UIImageView!
    @IBOutlet weak var messageImageView: UIImageView!
    
    var bottomHireMeButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomMyPortfolioImageViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomStackImageViewsConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setVC()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setVC(){
        setmyProfileImage()
        setHireMeButton()
    }
    
    func setmyProfileImage(){
        let whiteColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        myProfileImageView.image = #imageLiteral(resourceName: "Monkey")
        myProfileImageView.contentMode = UIViewContentMode.scaleAspectFill
        myProfileImageView.layer.masksToBounds = false
        myProfileImageView.layer.cornerRadius = CGFloat(roundf(Float(myProfileImageView.frame.size.width/2.0)))
        myProfileImageView.layer.borderColor = whiteColor.cgColor
        myProfileImageView.layer.borderWidth = 3
        myProfileImageView.clipsToBounds = true
        view.addSubview(myProfileImageView)
    }
    
    func setHireMeButton() {
        let hireMeButton = UIButton.init(type: UIButtonType.system)
        hireMeButton.setTitle("Hire Me!", for: UIControlState.normal)
        hireMeButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: UIControlState.normal)
        hireMeButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        hireMeButton.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        hireMeButton.layer.cornerRadius = 5
        //hireMeButton.addTarget(self, action: Selector(("hireMeButtonTouched:")), for: UIControlEvents.touchUpInside)
        view.addSubview(hireMeButton)
        
        //Auto-layout
        hireMeButton.translatesAutoresizingMaskIntoConstraints = false
        let centerXHireMeButtonConstraint = NSLayoutConstraint(item: hireMeButton, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0)
        let wigthHireMeButtonEdgeConstraint = NSLayoutConstraint(item: hireMeButton, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: myProfileImageView, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 0)
        bottomHireMeButtonConstraint = NSLayoutConstraint(item: hireMeButton, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.bottomMargin, multiplier: 1.0, constant: -130)
        view.addConstraints([centerXHireMeButtonConstraint, wigthHireMeButtonEdgeConstraint, bottomHireMeButtonConstraint])
        
    }
    
    @IBAction func hireMeButtonTouched(sender: AnyObject){
        print("HELLO!")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let isPortrait = size.height > size.width
        let isLandscape = size.width > size.height
        
        UIView.animate(withDuration: 0.25) {
            if isPortrait {
                print("Portrait")
                self.bottomHireMeButtonConstraint.constant = -130
                self.bottomMyPortfolioImageViewConstraint.constant = 30
                self.bottomStackImageViewsConstraint.constant = 30
            } else if isLandscape {
                print("Landscape")
                self.bottomHireMeButtonConstraint.constant = -10
                self.bottomMyPortfolioImageViewConstraint.constant = 10
                self.bottomStackImageViewsConstraint.constant = 10
            } else {
                print("ERROR")
            }
            self.view.layoutIfNeeded()
        }
        
    }
}

