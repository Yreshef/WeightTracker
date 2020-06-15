//
//  UIButton+AddUnderline.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 14/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit


extension UIButton {
  func underlineText() {
    guard let title = title(for: .normal) else { return }

    let titleString = NSMutableAttributedString(string: title)
    titleString.addAttribute(
      .underlineStyle,
      value: NSUnderlineStyle.single.rawValue,
      range: NSRange(location: 0, length: title.count)
    )
    setAttributedTitle(titleString, for: .normal)
  }
}
