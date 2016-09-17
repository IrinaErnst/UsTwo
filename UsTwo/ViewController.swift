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
    @IBOutlet weak var hireMeButton: UIButton!
    
    
    
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
        
    }
}

