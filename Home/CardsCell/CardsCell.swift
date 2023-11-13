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
    

}


extension CardsCell {
    func initialize(){
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: 100, height: 30)
        collectionViewLayout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero,collectionViewLayout: collectionViewLayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseId)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(collectionView)
    }
    
    func configure(text : String){
        label.text = text
    }
    
    func layout(){
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: 20),
            collectionView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


extension CardsCell : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath)
        cell.contentView.backgroundColor = .blue
        //cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0)
    }

}
