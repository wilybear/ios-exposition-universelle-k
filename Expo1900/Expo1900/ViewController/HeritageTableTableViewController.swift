//
//  HeritageTableTableViewController.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import UIKit

class HeritageTableTableViewController: UITableViewController {
    
    let cellIdentifier = "heritageCell"
    lazy var heritages: [Heritage] = {
        do {
            return try JsonParser.shared.getHeritages()
        } catch {
            fatalError("Failed to decode json data")
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "한국의 출품작"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heritages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HeritageTableViewCell else {
            fatalError("No matched reusable cell!")
        }
        let heritage = heritages[indexPath.row]
        cell.heritageImageView.image = UIImage(named: heritage.imageName)
        cell.heritageTitleLabel.text = heritage.name
        cell.heritageShortDescriptionLabel.text = heritage.shortDescription
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailViewController = storyboard?.instantiateViewController(withIdentifier: "heritageViewController") as? HeritageViewController else { return }
        detailViewController.heritage = heritages[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
