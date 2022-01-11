//
//  MasterpieceTableTableViewController.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import UIKit

class MasterpieceTableTableViewController: UITableViewController {
    
    let cellIdentifier = "masterpieceCell"
    lazy var masterpieces: [Masterpiece] = {
        do {
            return try DataManager.shared.getMasterpieces()
        } catch {
            fatalError("Failed to decode json data")
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "한국의 출품작"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return masterpieces.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MasterpieceTableViewCell else {
            fatalError("No matched reusable cell!")
        }
        let masterpiece = masterpieces[indexPath.row]
        cell.masterpieceImageView.image = UIImage(named: masterpiece.imageName)
        cell.masterpieceTitleLabel.text = masterpiece.name
        cell.masterpieceShortDescriptionLabel.text = masterpiece.shortDescription
        
        return cell
    }
}
