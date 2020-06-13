//
//  File.swift
//  
//
//  Created by Franck-Stephane Ndame Mpouli on 13/06/2020.
//

import UIKit

public extension UITableView {
    /// Registers the cell into the tableView using a reuseIdentifier coming from the `Reusable` protocol
    func register(cellType type: UITableViewCell.Type) {
        register(type, forCellReuseIdentifier: type.reuseIdentifier)
    }

    /// Dequeues a generic cell from the table view using the reuseIdentifier coming from the `Reusable` protocol.
    /// Note that the cell must be registered before into the table view with the same reuseIdentifier.
    func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("You need to register cell of type `\(T.reuseIdentifier)`")
        }
        
        return cell
    }
}

