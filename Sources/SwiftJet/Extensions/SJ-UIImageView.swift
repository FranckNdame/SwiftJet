//
//  File.swift
//  
//
//  Created by Franck-Stephane Ndame Mpouli on 13/06/2020.
//

import Foundation
import SDWebImage

public extension UIImageView {
    
    func populate(withURL url: String?, placeholderImage: UIImage) {
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        if let url = url {
            self.sd_setImage(
                with: URL(string: url),
                placeholderImage: placeholderImage
            )
        }
        else {
            self.sd_cancelCurrentImageLoad()
            self.image = placeholderImage
        }
    }
}
