//
//  ReposDataStore.swift
//  UsTwo
//
//  Created by Irina Ernst on 9/20/16.
//  Copyright © 2016 Irina Ernst. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    
    var repositories:[GithubRepository] = []
    
    func getRepositoriesWithCompletion(completion: @escaping () -> () ) {
        GithubAPIClient.getRepositoriesWithCompletion { (reposArray) in
            self.repositories.removeAll()
            for dictionary in reposArray {
                guard let repoDictionary = dictionary as? NSDictionary else {
                    assertionFailure("Object in the repoArray is non-dictionary type");
                    return
                }
                let repository = GithubRepository(dictionary: repoDictionary)
                print("REPO: %@", repository)
                self.repositories.append(repository)
            }
            
            if self.repositories.count > 0 {
                completion()
            }
        }
    }
}
