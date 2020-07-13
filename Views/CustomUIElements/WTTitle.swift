//
//  WTTitle.swift
//  WeightTracker
//
//  Created by Yohai Reshef on 13/06/2020.
//  Copyright © 2020 Yohai Reshef. All rights reserved.
//

import UIKit


public class WTTitle: UILabel {
    
    // MARK: - Components
    //=============================
    
    let tlFont = "Roboto-Bold"
    let tlFontSize: CGFloat = 28.0
    let tlTextColor: UIColor = .white
    let tlText: String = ""
    let tlTextAlignement: NSTextAlignment = .center
    let tlShadowcolor: UIColor = .black
    
    // MARK: - Life Cycle
    //=============================
    
    init() {
        
        super.init(frame: .zero)
        setupLabel()
    }
    
    init(labelText: String,
         fontName: String,
         fontSize: CGFloat,
         titleColor: UIColor,
         textAlignement: NSTextAlignment) {
        
        super.init(frame: .zero)
        setupLabel(labelText: labelText,
                   fontName: fontName,
                   fontSize: fontSize,
                   titleColor: titleColor,
                   textAlignement: textAlignment)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    //=============================

    private func setupLabel(){
        self.setupLabel(labelText: tlText, fontName: tlFont, fontSize: tlFontSize,
                        titleColor: tlTextColor, textAlignement: tlTextAlignement)
    }
           
    private func setupLabel(labelText: String,
                            fontName: String,
                            fontSize: CGFloat,
                            titleColor: UIColor,
                            textAlignement: NSTextAlignment) {
        
        text = labelText
        font = UIFont(name: fontName, size: fontSize)
        textColor = titleColor
        textAlignment = textAlignment
        
        
    }
      
}
