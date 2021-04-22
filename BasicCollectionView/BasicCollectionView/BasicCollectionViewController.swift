//
//  BasicCollectionViewController.swift
//  BasicCollectionView
//
//  Created by Curitiba on 09/04/21.
//

import UIKit

private let reuseIdentifier = "Cell"
let searchController = UISearchController()


class BasicCollectionViewController: UICollectionViewController, UISearchResultsUpdating {
    
    private let items = [
        "Alabama", "Alaska", "Arizona", "Arkansas", "California",
        "Colorado", "Connecticut", "Delaware", "Florida",
        "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa",
        "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland",
        "Massachusetts", "Michigan", "Minnesota", "Mississippi",
        "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire",
        "New Jersey", "New Mexico", "New York", "North Carolina",
        "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania",
        "Rhode Island", "South Carolina", "South Dakota", "Tennessee",
        "Texas", "Utah", "Vermont", "Virginia", "Washington",
        "West Virginia", "Wisconsin", "Wyoming"
    ]
    
    lazy var filteredItems: [String] = self.items
    var dataSource: UICollectionViewDiffableDataSource<Character, String>!

    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
        
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        collectionView.setCollectionViewLayout(generateLayout(), animated: false)
    }
    
    // Functions
    func updateSearchResults(for searchController: UISearchController) {
        if let searchString = searchController.searchBar.text,
               searchString.isEmpty == false {
                filteredItems = items.filter { (item) -> Bool in
                    item.localizedCaseInsensitiveContains(searchString)
                }
            } else {
                filteredItems = items
            }
        
            let itemsByInitialLetter = filteredItems.reduce([:]) {
               existing, element in
                return existing.merging([element.first!:[element]]) { old,
                   new in
                    return old + new
                }
            }
            let initialLetters = itemsByInitialLetter.keys.sorted()
        
            collectionView.reloadData()
    }

    
    
    
    //MARK: - Functions
    
    private func generateLayout() -> UICollectionViewLayout {
    let itemSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.0),
        heightDimension: .fractionalHeight(1.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(70.0)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 2
        )
        
        
        let spacing: CGFloat = 20
        item.contentInsets = NSDirectionalEdgeInsets(
            top: spacing,
            leading: spacing,
            bottom: 0,
            trailing: spacing
        )
        group.interItemSpacing = .fixed(30)// group spacing
        
        let section = NSCollectionLayoutSection(group: group)

        section.interGroupSpacing = 15
        
        section.interGroupSpacing = spacing
        
        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return filteredItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BasicCollectionViewCell
        cell.backgroundColor = .orange
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.7
        cell.frame.size.width =  150
        cell.frame.size.height = 76
        
        cell.label.text = filteredItems[indexPath.item]
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
