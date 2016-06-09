//
//  Episode.swift
//  CardView
//
//  Created by Duong Nguyen on 31/05/2016.
//  Copyright © 2016 Oliu. All rights reserved.
//

import Foundation

class Episode {
    private var _key: String!
    private var _title: String?
    private var _description: String?
    private var _location: String?
    private var _discount: String?
    private var _star: Int?
    private var _imagePath: String?
    
    var key: String! {
        return _key
    }
    
    var title: String? {
        return _title
    }
    
    var description: String? {
        return _description
    }
    
    var location: String? {
        return _location
    }
    
    var discount: String? {
        return _discount
    }
    
    var star: Int?{
        return _star
    }
    
    var imagePath: String? {
        return _imagePath
    }
    
    init(key: String!, title: String?, description: String?, location: String?, star: Int?) {
        self._key = key
        self._title = title
        self._description = description
        self._location = location
        self._star = star
    }
    
    init(key:String, dictionary:Dictionary<String,AnyObject?>){
        
        _key = key
        
        if let title = dictionary["title"] as? String {
            self._title = title
        }
        
        if let description = dictionary["description"] as? String {
            self._description = description
        }
        
        if let location = dictionary["location"] as? String {
            self._location = location
        }
        
        if let discount = dictionary["discount"] as? String {
            self._discount = discount
        }
        
        if let star = dictionary["star"] as? Int {
            self._star = star
        }
        
        if let imagePath = dictionary["imagePath"] as? String {
            self._imagePath = imagePath
        }
    }
}