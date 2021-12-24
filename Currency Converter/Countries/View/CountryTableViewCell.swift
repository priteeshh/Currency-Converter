//
//  CountryTableViewCell.swift
//  Currency Converter
//
//  Created by Preeteesh Remalli on 23/12/21.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var currencyCode: UILabel!
    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var countryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(countryVM : CountryVM){
        self.countryName.text = countryVM.name
        self.currencyCode.text = countryVM.currencyCode
        self.currencyName.text = countryVM.currencyName
        self.countryFlag.image = UIImage(data: countryVM.flag)

    }
    
}
