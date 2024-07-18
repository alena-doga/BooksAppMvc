//
//  Book.swift
//  BooksAppMvc
//
//  Created by Alena on 16.07.2024.
//

import Foundation
import UIKit

struct Book: Codable {
    var imageData: Data?
    let title: String
    let author: String
    let year: Int
    let impression: String
    let grade: Int
    
    var image: UIImage? {
        if let data = imageData {
            return UIImage(data: data)
        }
        return nil
    }
}
