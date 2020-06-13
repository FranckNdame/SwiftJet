//
//  File.swift
//  
//
//  Created by Franck-Stephane Ndame Mpouli on 13/06/2020.
//

import UIKit

class CheckBox: UIButton {
    enum State { case checked, unchecked }
    var currentState: State = .unchecked
    private var checked: Bool = false
    private var checkedImage: UIImage?
    private var uncheckedImage: UIImage?
    
    init(frame: CGRect, uncheckedImage: UIImage, checkedImage: UIImage, tint: UIColor = .black) {
        super.init(frame: frame)
        setImage(uncheckedImage, for: .normal)
        addTarget(self, action: #selector(self.toggle), for: .touchUpInside)
        tintColor = tint
        self.checkedImage = checkedImage
        self.uncheckedImage = uncheckedImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func getState() -> State {
        return self.checked ? .checked : .unchecked
    }

    @objc func toggle() {
        guard
            let checkedImage = checkedImage,
            let uncheckedImage = uncheckedImage
        else { return }
        checked = !checked
        setImage(checked ? checkedImage : uncheckedImage, for: .normal)
    }
}
