//
//  BookTableViewCell.swift
//  BooksAppMvc
//
//  Created by Alena on 16.07.2024.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var tableImage: UIImageView!
    
    @IBOutlet weak var tableTitle: UILabel!
    
    @IBOutlet weak var tableAuthor: UILabel!
    
    @IBOutlet weak var tableYear: UILabel!
    
    
    @IBOutlet weak var tableImpression: UILabel!
    
    
    @IBOutlet weak var tableGrade: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
