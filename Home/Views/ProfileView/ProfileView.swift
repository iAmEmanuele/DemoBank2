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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addShadow()
    }
    
    func configure(mainIfo: MainInfo) {
        nameLabel.text = "\(mainIfo.nome) \(mainIfo.cognome)"
        let balance = mainIfo.saldo.formatDoubleToString(maximunFractionDigits: "%.2f")
        balanceLabel.text = "Saldo: \(balance) €"
        profileImage.image = UIImage(named: "ProfileImage")
    }
    
    func initialize(){
        loadfromNib()
        style()
    }
    
    
}

extension ProfileView {
    func addShadow(){
        contentView.layer.cornerRadius = 20.0
        contentView.layer.shadowColor = UIColor.gray.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        contentView.layer.shadowRadius = 12.0
        contentView.layer.shadowOpacity = 0.7
        
    }
    func style() {
        
        // contentView
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.clipsToBounds = true
        contentView.layer.masksToBounds = false
        //profileImage
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.clipsToBounds = true
    }
    
    func layout(){
        let trailingConstraint =  contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20)
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


