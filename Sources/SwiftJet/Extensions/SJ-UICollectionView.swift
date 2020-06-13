//
//  SJ-UICollectionView.swift
//  
//
//  Created by Franck-Stephane Ndame Mpouli on 13/06/2020.
//

import UIKit

public extension UICollectionView {
    /// Registers the cell into the collectionView using a reuseIdentifier coming from the `Reusable` protocol
    func register(cellType type: UICollectionViewCell.Type) {
        register(type, forCellWithReuseIdentifier: type.reuseIdentifier)
    }

    /// Dequeues a generic cell from the collection view using the reuseIdentifier coming from the `Reusable` protocol.
    /// Note that the cell must be registered before into the collection view with the same reuseIdentifier.
    func dequeueCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("You need to register cell of type `\(T.self)`")
        }
        
        return cell
    }
    
    func registerReusableSupplementaryView<T: UICollectionReusableView>(reusableViewType type: T.Type, forKind kind: String) {
        self.register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerNibForReusableSupplementaryView<T: UICollectionReusableView>(reusableViewType type: T.Type, forKind kind: String) {
        let reuseIdentifier = T.reuseIdentifier
        self.register(UINib(nibName: reuseIdentifier, bundle: nil),
                      forSupplementaryViewOfKind: kind,
                      withReuseIdentifier: reuseIdentifier)
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(forKind kind: String, for indexPath: IndexPath) -> T {
        let reuseIdentifier = "\(T.reuseIdentifier)"
        let someView = self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifier, for: indexPath)
        guard let view = someView as? T else {
            fatalError("You need to register supplementary view of type \(T.self)")
        }
        return view
    }

    func displayableIndexAndTotal(fromIndexPath: IndexPath, section: Int) -> (Int, Int) {
        let index = fromIndexPath.row + 1
        let total = self.numberOfItems(inSection: section)

        return (index, total)
    }
}

