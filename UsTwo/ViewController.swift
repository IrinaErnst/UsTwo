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
    var hireMeButton: UIButton!
    
    //Constraints
    var bottomHireMeButtonConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomMyPortfolioImageViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomStackImageViewsConstraint: NSLayoutConstraint!
    @IBOutlet weak var widthMyProfileImageViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightMyProfileImageViewConstraint: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setVC()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setVC(){
        setmyProfileImage()
        setStackImages()
        setHireMeButton()
    }
    
    func setmyProfileImage(){
        let whiteColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        myProfileImageView.image = #imageLiteral(resourceName: "Monkey")
        myProfileImageView.contentMode = UIViewContentMode.scaleAspectFill
        myProfileImageView.layer.masksToBounds = true
        myProfileImageView.layer.cornerRadius = CGFloat(roundf(Float(myProfileImageView.frame.size.width/2.0)))
        myProfileImageView.layer.borderColor = whiteColor.cgColor
        myProfileImageView.layer.borderWidth = 3
        myProfileImageView.clipsToBounds = true
        view.addSubview(myProfileImageView)
    }
    
    func setStackImages(){
        let socialMediaImageViews: Array<UIImageView> = [linkedInImageView, githubImageView, facebookImageView, messageImageView]
        var num = 0
        for item in socialMediaImageViews {
            switch item {
            case linkedInImageView:
                item.image = #imageLiteral(resourceName: "LinkedIn")
                num = 1
            case githubImageView:
                item.image = #imageLiteral(resourceName: "Github")
                num = 2
            case facebookImageView:
                item.image = #imageLiteral(resourceName: "Facebook")
                num = 3
            case messageImageView:
                item.image = #imageLiteral(resourceName: "Message")
                num = 4
            default: print("ERROR")
            }
            item.contentMode = UIViewContentMode.scaleAspectFill
            
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageLinkedInTapped(sender:)))
            item.isUserInteractionEnabled = true
            item.tag = num
            item.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    func setHireMeButton() {
        hireMeButton = UIButton.init(type: UIButtonType.system)
        hireMeButton.setTitle("Hire Me!", for: UIControlState.normal)
        hireMeButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: UIControlState.normal)
        hireMeButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        hireMeButton.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        hireMeButton.layer.cornerRadius = 5
        hireMeButton.addTarget(self, action: #selector(hireMeButtonTouched(sender:)), for: UIControlEvents.touchUpInside)
        view.addSubview(hireMeButton)
        
        //Auto-layout
        hireMeButton.translatesAutoresizingMaskIntoConstraints = false
        let centerXHireMeButtonConstraint = NSLayoutConstraint(item: hireMeButton, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0)
        let wigthHireMeButtonEdgeConstraint = NSLayoutConstraint(item: hireMeButton, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: myProfileImageView, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 0)
        bottomHireMeButtonConstraint = NSLayoutConstraint(item: hireMeButton, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.bottomMargin, multiplier: 1.0, constant: -130)
        view.addConstraints([centerXHireMeButtonConstraint, wigthHireMeButtonEdgeConstraint, bottomHireMeButtonConstraint])
    }
    
    @IBAction func hireMeButtonTouched(sender: UIButton!){
        UIView.animate(withDuration: 0.25) {
            self.hireMeButton.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }
        animateMyProforileImageView()
    }
    
    func animateMyProforileImageView() {
        UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 3, options: [.autoreverse], animations: {
            self.widthMyProfileImageViewConstraint.constant = 320
            self.heightMyProfileImageViewConstraint.constant = 320
            self.myProfileImageView.layer.cornerRadius = CGFloat(160)
            self.myProfileImageView.image = #imageLiteral(resourceName: "Monkey Surprised")
            self.view.layoutIfNeeded()
            }) { (isFinished) in
                self.widthMyProfileImageViewConstraint.constant = 242
                self.heightMyProfileImageViewConstraint.constant = 242
                self.myProfileImageView.layer.cornerRadius = CGFloat(121)
                self.myProfileImageView.image = #imageLiteral(resourceName: "Monkey")
                self.view.layoutIfNeeded()
        }
    }
    
    func imageLinkedInTapped(sender: UITapGestureRecognizer){
        if let item = sender.view?.tag {
            switch item {
            case 1:
                print("TAPPED LIKED IN")
                self.performSegue(withIdentifier: "LinkedInSegue", sender: nil)
            case 2:
                print("TAPPED GITHUB")
            case 3:
                print("TAPPED GITHUB")
            case 4:
                print("TAPPED MSG")
            default:
                print("ERROR")
            }
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "LinkedInSegue" {
//            
//        }
//    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let isPortrait = size.height > size.width
        let isLandscape = size.width > size.height
        
        UIView.animate(withDuration: 0.25) {
            if isPortrait {
                self.bottomHireMeButtonConstraint.constant = -130
                self.bottomMyPortfolioImageViewConstraint.constant = 30
                self.bottomStackImageViewsConstraint.constant = 30
            } else if isLandscape {
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

