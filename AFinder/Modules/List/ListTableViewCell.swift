//
//  ListTableViewCell.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    // MARK: Properties
    var airportData: AirportResponse.AirportData?{
        didSet{
            if let data = airportData {
                iconImageView.image = UIImage(named: "airport_placeholder")
                nameLabel.text = data.name
                codeLabel.text = code(data.iataCode)
                timeZoneLabel.text = timeZone(data.timeZoneOffset)
            }
        }
    }
    
    // MARK: IBOutlet
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var timeZoneLabel: UILabel!
    
    
    // MARK: Init
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    // MARK: Functions
    func code(_ c:String?)->String{
        guard let codeExists = c else {
            return "Unknown code".localized()
        }
        let translation = "Code".localized()
        return "\(translation): \(codeExists)"
    }
    
    func timeZone(_ t:String?)->String{
        guard let timeExists = t else {
            return "Unknown time zone".localized()
        }
        let translation = "Time zone".localized()
        return "\(translation): \(timeExists)"
    }
    
}
