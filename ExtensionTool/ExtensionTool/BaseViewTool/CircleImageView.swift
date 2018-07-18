//
//  CircleImageView.swift
//  ExtensionTool
//
//  Created by 张崇超 on 2018/7/10.
//  Copyright © 2018年 ZCC. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setCircleImgV()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setCircleImgV()
    }
    
    private func setCircleImgV() {
        
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = frame.height / 2.0
        self.clipsToBounds = true
    }
}
