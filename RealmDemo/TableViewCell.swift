//
//  TableViewCell.swift
//  RealmDemo
//
//  Created by trinh.hoang.hai on 3/19/19.
//  Copyright © 2019 trinh.hoang.hai. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBAction func deletePerson(_ sender: Any) {
        deletePer?()
    }

    var deletePer: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
