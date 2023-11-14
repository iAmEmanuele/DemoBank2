//
//  ProfileView.swift
//  DemoBank2
//
//  Created by Emanuele Baragiano on 08/11/23.
//

import UIKit


class ProfileView : UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet var profileImage: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var balanceLabel: UILabel!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    func configure(mainIfo: MainInfo) {
        nameLabel.text = "\(mainIfo.nome) \(mainIfo.cognome)"
        balanceLabel.text = "Saldo: \(mainIfo.saldo)"
        profileImage.image = UIImage(named: "ProfileImage")
    }
    
    func initialize(){
        loadfromNib()
        style()
        layout()
    }
    
    
}

extension ProfileView {
    func style() {
        
        // contentView
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.5
        contentView.layer.shadowRadius = 8
        contentView.layer.shouldRasterize = true
        contentView.layer.rasterizationScale = UIScreen.main.scale
        
        //profileImage
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
    }
    
    func layout(){
        let trailingConstraint =  contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        trailingConstraint.priority = .defaultHigh
        NSLayoutConstraint.activate([
            
            contentView.leadingAnchor.constraint(equalTo:  self.leadingAnchor, constant:  20),
            trailingConstraint,
            contentView.heightAnchor.constraint(equalToConstant: 200.0),
            contentView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 20),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}


