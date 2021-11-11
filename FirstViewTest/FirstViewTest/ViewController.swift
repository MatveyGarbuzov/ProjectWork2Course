//
//  ViewController.swift
//  FirstViewTest
//
//  Created by Matvey Garbuzov on 10.11.2021.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var arrayOfGameTitles = [String]()
    var myIndex = 0
    private var collectionView: UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        addImagesToAnArray()
        setupCollectionView()
    }
    
    
    // Add images to an array to use as game icons
    func addImagesToAnArray() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("gameIcon") {
                print(item)
                arrayOfGameTitles.append(item)
            }
        }
        print(arrayOfGameTitles.count)
        print(arrayOfGameTitles)
        arrayOfGameTitles.sort()
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 45
        layout.minimumInteritemSpacing = 12
        layout.sectionInset.left = 20
        layout.sectionInset.right = 20
        layout.sectionInset.top = 20
        
        let marginLeft = layout.sectionInset.left
        let marginRight = layout.sectionInset.right
        
        layout.itemSize = CGSize(
            width: (view.frame.size.width - marginLeft - marginRight)/2-layout.minimumInteritemSpacing,
            height: (view.frame.size.width - marginLeft - marginRight)/2-layout.minimumInteritemSpacing
        )
        
        collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(
            CustomCollectionViewCell.self ,
            forCellWithReuseIdentifier: CustomCollectionViewCell.identifier
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfGameTitles.count
    }
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomCollectionViewCell.identifier,
            for: indexPath
        ) as? CustomCollectionViewCell else { fatalError("Wrong cell") }
        let title = arrayOfGameTitles[myIndex]
        cell.updateCell(title: title)
        myIndex += 1
    
        return cell
    }
    /*
     
     let headerText = NSMutableAttributedString(string: "Hello, what game do you want to play today?")
     
     // Set different colors
     headerText.addAttribute(NSAttributedString.Key.foregroundColor, value: myLightBlueColor, range: _NSRange(location: 0, length: headerText.length))
     headerText.addAttribute(NSAttributedString.Key.foregroundColor, value: myBlueColor, range: _NSRange(location: 12, length: 4))
     headerText.addAttribute(NSAttributedString.Key.foregroundColor, value: myBlueColor, range: _NSRange(location: 29, length: 7))
     
     */

}

