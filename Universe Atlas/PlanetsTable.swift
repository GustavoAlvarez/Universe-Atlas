//
//  PlanetsTable.swift
//  Universe Atlas
//
//  Created by Gustavo Alvarez on 06/08/17.
//  Copyright © 2017 ParanoidDev. All rights reserved.
//

import UIKit

class planetCell: UITableViewCell{
    
    @IBOutlet weak var planetImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var systemLabel: UILabel!
    @IBOutlet weak var galaxyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}

class PlanetsTable: UITableViewController {

    
    let planets = ["Earth", "Mars", "Saturn", "Venus", "Earth", "Mars", "Saturn", "Venus"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationController?.navigationBar.barTintColor = hexStringToUIColor(hex: "262042")
        UIApplication.shared.statusBarStyle = .lightContent
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
    }



    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:planetCell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! planetCell
        
        let row = indexPath.row
        
        cell.planetImage.image = UIImage(named: planets[row])
        cell.nameLabel.text = planets[row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
        
    }
    

    
    func hexStringToUIColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}
