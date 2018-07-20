//
//  UIView+Ext.swift
//  OrderManager
//
//  Created by 张崇超 on 2018/7/11.
//  Copyright © 2018年 ZCC. All rights reserved.
//

import UIKit

extension UIView {
    
    // IBInspectble
    @IBInspectable var borderColor: UIColor? {
        set {
            self.layer.borderColor = newValue?.cgColor
        }
        get { return nil }
    }
    @IBInspectable var borderWidth: CGFloat {
        set {
            self.layer.borderWidth = newValue
        }
        get { return 0.0 }
    }
    @IBInspectable var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue
            self.clipsToBounds = true
        }
        get { return 0.0 }
    }
}

extension UIView {
    
    /// x
    var k_x: CGFloat {
        set {
            
            var newFrame = self.frame
            newFrame.origin.x = newValue
            self.frame = newFrame
        }
        get { return self.frame.origin.x }
    }
    /// y
    var k_y: CGFloat {
        set {
            
            var newFrame = self.frame
            newFrame.origin.y = newValue
            self.frame = newFrame
        }
        get { return self.frame.origin.y }
    }
    /// width
    var k_width: CGFloat {
        set {
            
            var newFrame = self.frame
            newFrame.size.width = newValue
            self.frame = newFrame
        }
        get { return self.frame.size.width }
    }
    /// height
    var k_height: CGFloat {
        set {
            
            var newFrame = self.frame
            newFrame.size.height = newValue
            self.frame = newFrame
        }
        get { return self.frame.size.height }
    }
    /// size
    var k_size: CGSize {
        set {
            
            var newFrame = self.frame
            newFrame.size = newValue
            self.frame = newFrame
        }
        get { return self.frame.size }
    }
    
    /// center
    var k_center: CGPoint {
        set {
            
            var newCenter = self.center
            newCenter = newValue
            self.center = newCenter
        }
        get { return self.center }
    }
    /// 中心点x
    var k_centerX: CGFloat {
        set {
            
            var newCenter = self.center
            newCenter.x = newValue
            self.center = newCenter
        }
        get { return self.center.x }
    }
    /// 中心点y
    var k_centerY: CGFloat {
        set {
            
            var newCenter = self.center
            newCenter.y = newValue
            self.center = newCenter
        }
        get {
            return self.center.y
        }
    }
}

var k_UIViewClickActionKey: Int = 0

extension UIView {
    
    //MARK: xib加载View
    /// xib加载View
    ///
    /// - Returns: UIView
    class func k_viewFromXib(size: CGSize = UIScreen.main.bounds.size) -> UIView {
        let className = NSStringFromClass(self)
        let xibView = Bundle.main.loadNibNamed(String(className), owner: nil, options: nil)?.last as! UIView
        xibView.frame = CGRect(origin: CGPoint.zero, size: size)
        
        return xibView
    }
    
    //MARK: 设置为圆形控件
    /// 设置为圆形控件
    func k_setCircleImgV() {
        
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = frame.height / 2.0
        self.clipsToBounds = true
    }
    
    //MARK: 设置圆角
    /// 设置圆角
    ///
    /// - Parameter radius: 圆角数
    func k_setCornerRadius(_ radius: CGFloat) {
        
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    //MARK: 设置边框
    /// 设置边框
    ///
    /// - Parameters:
    ///   - color: 颜色
    ///   - width: 宽度
    func k_setBorder(color: UIColor, width: CGFloat) {
        
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    //MARK: 添加点击事件
    /// 添加点击事件
    ///
    /// - Parameters:
    ///   - target: 目标
    ///   - action: 事件
    func k_addTarget(_ target: Any, action: Selector) {
        
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: target, action: action)
        self.addGestureRecognizer(tap)
    }

    /// 添加点击事件
    ///
    /// - Parameter clickAction: 点击回调
    func k_addTarget(_ clickAction: ((UIGestureRecognizer)->Void)?) {
        
        objc_setAssociatedObject(self, &k_UIViewClickActionKey, clickAction, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(k_tapAction))
        self.addGestureRecognizer(tap)
    }
    
    /// 添加长按事件
    ///
    /// - Parameter clickAction: 点击回调
    func k_addLongPressTarget(_ clickAction: ((UIGestureRecognizer)->Void)?) {
        
        objc_setAssociatedObject(self, &k_UIViewClickActionKey, clickAction, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        
        self.isUserInteractionEnabled = true
        let tap = UILongPressGestureRecognizer.init(target: self, action: #selector(k_tapAction))
        self.addGestureRecognizer(tap)
    }
    
    /// 点击事件
    @objc func k_tapAction(tap: UIGestureRecognizer) {
        
        (objc_getAssociatedObject(self, &k_UIViewClickActionKey) as! ((UIGestureRecognizer)->Void)?)?(tap)
    }
    
    //MARK: 单击移除键盘
    /// 单击移除键盘
    func k_tapDismissKeyboard() {
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapDismissAction))
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (note) in
            
            self.addGestureRecognizer(tap)
        }
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidHide, object: nil, queue: OperationQueue.main) { (note) in
            
            self.removeGestureRecognizer(tap)
        }
    }
    @objc func tapDismissAction() {
        
        self.endEditing(true)
    }
}


/// 国际化
extension UILabel {
    
    @IBInspectable var localizedString: String {
        set {
            self.text = NSLocalizedString(newValue, comment: "")
        }
        get { return "" }
    }
}

extension UIButton {
    
    @IBInspectable var localizedString: String {
        set {
            self.setTitle(NSLocalizedString(newValue, comment: ""), for: self.state)
        }
        get { return "" }
    }
}
