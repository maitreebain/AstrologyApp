//
//  DetailViewController.swift
//  Astrology App
//
//  Created by Maitree Bain on 7/6/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var signSummaryText: UITextView!
    
    var user: UserModel?
    let apiClient = AstrologyAPIClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getSign()
    }
    
    func getSign() {
        guard let user = user else { return }
        apiClient.getSign(for: user.sign) { (result) in
            
            switch result {
            case .success(let astrology):
                DispatchQueue.main.async {
                    self.nameLabel.text = "Mood: \(astrology.meta.mood)"
                    self.signSummaryText.text = astrology.horoscope
                }
            case .failure(let error):
                print("\(error)")
            }
        }
    }

}
