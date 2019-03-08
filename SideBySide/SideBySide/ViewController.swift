//
//  ViewController.swift
//  SideBySide
//
//  Created by Elliot Glaze on 08/03/2019.
//  Copyright © 2019 Elliot Glaze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let btn1 = UIView()
        btn1.backgroundColor = .blue
        
        let btn2 = UIView()
        btn2.backgroundColor = .red
        
        let btn3 = UIView()
        btn3.backgroundColor = .green
        
        [btn1, btn2, btn3].forEach{view.addSubview($0)}
        
        let screenSize = UIScreen.main.bounds
        let thirdScreenSize = screenSize.width / 3
        
        
        btn1.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: btn2.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: thirdScreenSize, height: 0))
        btn2.anchor(top: view.topAnchor, leading: btn1.trailingAnchor, bottom: view.bottomAnchor, trailing: btn3.leadingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: thirdScreenSize, height: 0))
        btn3.anchor(top: view.topAnchor, leading: btn2.trailingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: thirdScreenSize, height: 0))
        
        
    }


}
extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero){
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
    }
}

