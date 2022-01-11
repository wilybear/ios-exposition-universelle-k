//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpoViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var visitorCountLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    lazy var expoModel: InternationalExposition = {
        do {
            return try DataManager.shared.getExposition()
        } catch {
            fatalError("Failed to decode json data")
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabelText()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func configureLabelText() {
        titleLabel.text = expoModel.title
        visitorCountLabel.text = "\(expoModel.visitors.withCommas()) 명"
        locationLabel.text = expoModel.location
        durationLabel.text = expoModel.duration
        contentLabel.text = expoModel.description
    }
}

