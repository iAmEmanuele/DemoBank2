//
//  CardsCell.swift
//  DemoBank2
//
//  Created by Emanuele Baragiano on 09/11/23.
//

import UIKit

class CardsCell : UITableViewCell  {
    var collectionView =  UICollectionView(frame: .zero,collectionViewLayout: UICollectionViewLayout())
   
    let label = UILabel()
    let reuseId = "customCollectionCell"
    var cards : [Card] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
        layout()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
        layout()
    }
    
    func configure(temp : [Card]){
       cards = temp
    }
    

}


extension CardsCell {
    func initialize(){
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: 100, height: 30)
        collectionViewLayout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: collectionViewLayout)
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: reuseId)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(collectionView)
    }
    
  
    
    func layout(){
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 20),
            collectionView.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}


extension CardsCell : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! CardCell
        cell.configure(card: cards[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
         20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 70)
    }
}
