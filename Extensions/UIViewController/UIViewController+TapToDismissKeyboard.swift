//
//  UIViewController+TapToDismissKeyboard.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 24/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit

extension UIViewController {
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
}
