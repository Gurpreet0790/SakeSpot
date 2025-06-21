//
//  ImageCacheManager.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-21.
//

import Foundation
import SwiftUI
import UIKit


class ImageCacheManager{
    static let shared = ImageCacheManager()
    private let cache = NSCache<NSString, UIImage>()
    
    private init() { }
    
    
    func get(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func set(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
}
