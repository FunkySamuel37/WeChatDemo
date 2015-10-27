//
//  TextBackgroundView.swift
//  WeChatDemo
//
//  Created by Samuel37 on 15/10/27.
//  Copyright © 2015年 Samuel37. All rights reserved.
//

import UIKit

class TextBackgroundView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 5
        
        self.alpha = 0.95
    }
    
}
