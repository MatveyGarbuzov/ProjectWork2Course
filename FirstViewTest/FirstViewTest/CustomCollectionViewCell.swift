//
//  CustomCollectionViewCell.swift
//  FirstViewTest
//
//  Created by Matvey Garbuzov on 11.11.2021.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    var arrayOfGameImages = [UIImage]()
    var count = 0
    
    let myBlueColor = UIColor (
        red: 93 / 255.0,
        green: 95 / 255.0,
        blue: 239 / 255.0,
        alpha: 1
    )
    let myLightBlueColor = UIColor (
        red: 165 / 255.0,
        green: 166 / 255.0,
        blue: 246 / 255.0,
        alpha: 1
    )
    let myLightGray = UIColor (
        red: 235 / 255.0,
        green: 235 / 255.0,
        blue: 235 / 255.0,
        alpha: 1
    )
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Lato-Regular", size: 23)
        return label
    }()
    
    private var myLike: UIImageView = {
        let like = UIImageView()
        return like
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.layer.frame.size.height = 1
        contentView.layer.frame.size.width = 1
        contentView.layer.cornerRadius = 24
        contentView.layer.shadowOffset = CGSize(width: 0.0, height: 7)
        contentView.layer.shadowRadius = 12.0
        contentView.layer.shadowOpacity = 0.18
        contentView.layer.masksToBounds = false
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        contentView.addSubview(myLike)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myLabel.frame = CGRect(
            x: 5,
            y: contentView.frame.size.height-50,
            width: contentView.frame.size.width-10,
            height: 50
        )
        
        myImageView.frame = CGRect(
            x: 10,
            y: 20,
            width: contentView.frame.size.width-20,
            height: contentView.frame.size.height-70
        )
        
        myLike.frame = CGRect(
            x: contentView.frame.size.width-35,
            y: 12,
            width: 26,
            height: 26
        )
    }
    
    func printTest(something: String) {
        print("Pass \(something)")
    }
    
    func updateCell(title: String) {
        let newTitle = title.dropFirst(10).dropLast(4)
        print("Pass \(title)")
        myLabel.text = String(newTitle)
        myImageView.image = UIImage(named: title)
        if newTitle == "ComingSoon" {
            myLabel.text = "Coming Soon"
            contentView.backgroundColor = myLightGray
        } else {
            myLike.image = UIImage(named: "likeUnpressed.png")
            if newTitle == "BattleCity" {
                myLabel.text = "Battle City"
                myLike.image = UIImage(named: "likePressed.png")
            }
            let templateImage = self.myLike.image?.withRenderingMode(.alwaysTemplate)
            myLike.image = templateImage
            myLike.tintColor = myBlueColor
        }
    }
    
    

}
