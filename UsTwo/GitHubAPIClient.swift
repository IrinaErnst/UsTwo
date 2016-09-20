//
//  GitHubAPIClient.swift
//  UsTwo
//
//  Created by Irina Ernst on 9/20/16.
//  Copyright © 2016 Irina Ernst. All rights reserved.
//

import UIKit
import Foundation

class GithubAPIClient {
    
    class func getRepositoriesWithCompletion(completion: @escaping (NSArray) -> () ) {
        let urlString = "https://api.github.com/repositories?client_id=\(GITHUB_CLIENT_ID)&client_secret=\(GITHUB_CLIENT_SECRET)"
        let url = URL(string: urlString)
        let session = URLSession.shared
        guard let potentialURL = url else {
            assertionFailure("Invalid URL");
            return
        }
        let task = session.dataTask(with: potentialURL) { (data, response, error) in
            guard let data = data else {
                assertionFailure("Unable to get data \(error?.localizedDescription)");
                return
            }
            if let responseArray = try? JSONSerialization.jsonObject(with: data, options: []) as? NSArray {
                if let responseArray = responseArray {
                    completion(responseArray)
                }
            }
        }
        task.resume()
    }
    
}
