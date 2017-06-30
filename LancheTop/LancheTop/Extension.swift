//
//  Extension.swift
//  LancheTop
//
//  Created by Júlio César Garavelli on 29/06/17.
//  Copyright © 2017 Júlio Garavelli. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func getImageWithURL() -> UIImage {
        let url = URL(string: self)
        let data = try? Data(contentsOf: url!)
        if data != nil {
            return UIImage(data: data!)!
        } else {
            return UIImage()
        }
    }
    
}


extension Array where Element: Equatable {
    
    mutating func removeEqualItems(item: Element) {
        self = self.filter { (currentItem: Element) -> Bool in
            return currentItem != item
        }
    }
    
    mutating func removeFirstEqualItem(item: Element) {
        guard var currentItem = self.first else { return }
        var index = 0
        while currentItem != item {
            index += 1
            currentItem = self[index]
        }
        self.remove(at: index)
    }
    
}
