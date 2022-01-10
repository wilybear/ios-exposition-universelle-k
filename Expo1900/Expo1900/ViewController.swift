//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    
    
    var datas: [EntryData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        guard let asset = NSDataAsset.init(name: "items") else {
            return
        }
        
        let decoder = JSONDecoder()
        do {
            datas = try decoder.decode([EntryData].self, from: asset.data)
        } catch {
            
        }
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let entry = datas[indexPath.row]
        cell.textLabel?.text = entry.name
        cell.imageView?.image = UIImage(named: entry.image)
        return cell
    }
    
    
}

