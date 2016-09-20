//
//  GithubRepository.swift
//  UsTwo
//
//  Created by Irina Ernst on 9/20/16.
//  Copyright © 2016 Irina Ernst. All rights reserved.
//

import UIKit

class GithubRepository {
    var fullName: String = ""
//    var htmlURL: URL
//    var repositoryID: String = ""
    
    init(dictionary: NSDictionary) {
        print("GITHUB REPOSITORY")
        print(dictionary)
        guard let
        name = dictionary["full_name"] as? String
//        valueAsString = dictionary["html_url"] as? String,
//        valueAsURL = URL(string: valueAsString),
//        repoID = (dictionary["id"] as AnyObject).stringValue
        else {
            fatalError("Error creating instance of GithubRepository")
        }
        
        fullName = name
//        htmlURL = valueAsURL
//        repositoryID = repoID
    }
}
