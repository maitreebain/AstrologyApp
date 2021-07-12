//
//  DetailViewController.swift
//  Astrology App
//
//  Created by Maitree Bain on 7/6/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var moodLabel: UILabel!
    @IBOutlet var signSummaryText: UITextView!
    @IBOutlet var videoLabel: UIButton!
    @IBOutlet var comingSoonLabel: UILabel!
    
    var user: UserModel?
    let apiClient = AstrologyAPIClient()
    var starNumber: [Int] = [1,2,3]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        updateUI()
        self.imageView.image = UIImage(named: "star\(self.starNumber.randomElement() ?? 1)")
        getSign()
    }
    
    func updateUI() {
        imageView.layer.masksToBounds = true
        moodLabel.layer.masksToBounds = true
        signSummaryText.layer.masksToBounds = true
        videoLabel.layer.masksToBounds = true
        comingSoonLabel.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        moodLabel.layer.cornerRadius = 4
        signSummaryText.layer.cornerRadius = 8
        videoLabel.layer.cornerRadius = 4
        comingSoonLabel.layer.cornerRadius = 4
    }
    
    func getSign() {
        guard let user = user else { return }
        title = user.sign
        apiClient.getSign(for: user.sign) { (result) in
            
            switch result {
            case .success(let astrology):
                DispatchQueue.main.async {
                    self.moodLabel.text = "Mood: \(astrology.meta.mood.capitalized)"
                    self.signSummaryText.text = astrology.horoscope
                }
            case .failure(let error):
                print("\(error)")
            }
        }
    }

}
