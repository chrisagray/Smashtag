//
//  RecentSearches.swift
//  Smashtag
//
//  Created by Chris Gray on 10/13/16.
//  Copyright © 2016 Stanford University. All rights reserved.
//

import Foundation

class RecentSearches
{
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    var searches: [String] {
        get {
            return defaults.objectForKey("recent") as? [String] ?? []
        }
        set {
            defaults.setObject(newValue, forKey: "recent")
        }
    }
    
    func addToRecentSearches(mostRecentSearchString: String) {

        var currentSearches = searches
        
        if let duplicateIndex = currentSearches.indexOf(mostRecentSearchString) {
            currentSearches.removeAtIndex(duplicateIndex)
        }
        
        currentSearches.insert(mostRecentSearchString, atIndex: 0)
        
        while currentSearches.count > 100 {
            currentSearches.removeLast()
        }
        searches = currentSearches
    }   
}