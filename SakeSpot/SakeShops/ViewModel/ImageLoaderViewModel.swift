//
//  ImageLoaderViewModel.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-21.
//

import Foundation
import SwiftUI

class ImageLoaderViewModel : ObservableObject {
    @Published var image: UIImage?
    
    func load(from urlString: String?) {
        
        guard let urlString = urlString?.trimmingCharacters(in: .whitespacesAndNewlines),
              let url = URL(string: urlString) else {
            return
        }
        
        if let cacheImage = ImageCacheManager.shared.get(forKey: urlString){
            self.image = cacheImage
            return
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let shopImage = UIImage(data: data){
                DispatchQueue.main.async{
                    ImageCacheManager.shared.set(shopImage, forKey: urlString)
                    self.image = shopImage
                }
            }
        }.resume()
    }
}
