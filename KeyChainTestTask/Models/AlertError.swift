//
//  AlertError.swift
//  KeyChainTestTask
//
//  Created by Сергей Горбачёв on 12.10.2021.
//

import UIKit

extension UIViewController {
    
    func alertError() {
        
        let alert = UIAlertController(title: "Error", message: "Fill in all the fields", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(ok)

        present(alert, animated: true, completion: nil)
    }
}


