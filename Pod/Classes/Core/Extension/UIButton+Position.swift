//
//  UIButton+Position.swift
//  ANBaseUI
//
//  Created by yanlan on 2019/12/11.
//

import UIKit

public enum ButtonEdgeInsetsStyle {
    case top
    case left
    case right
    case bottom
}

public extension UIButton {
    
    /// 调整拥有文字和图片按钮中 文字和图片的位置
    /// - Parameters:
    ///   - style: 调整的样式
    ///   - imageTitleSpace: 文字和图片的间距
    func layoutButtonWithEdgeInsetsStyle(_ style: ButtonEdgeInsetsStyle,_ imageTitleSpace: CGFloat = 10) {
        
        // 1. 得到imageView和titleLabel的宽、高
        let imageWidth = imageView?.image?.size.width ?? 0
        let imageHeight = imageView?.image?.size.height ?? 0
        
        var labelWidth: CGFloat = 0.0;
        var labelHeight: CGFloat = 0.0;
        if (UIDevice.current.systemVersion as NSString).floatValue >= 8.0 {
            labelWidth = titleLabel?.intrinsicContentSize.width ?? 0
            labelHeight = titleLabel?.intrinsicContentSize.height ?? 0
        } else {
            labelWidth = titleLabel?.frame.width ?? 0
            labelHeight = titleLabel?.frame.height ?? 0
        }
        
        // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
        var imageEdgeInsets = UIEdgeInsets.zero;
        var labelEdgeInsets = UIEdgeInsets.zero;
        
        // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch style {
        case .top:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight-imageTitleSpace/2.0, left: 0, bottom: 0, right: -labelWidth);
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth, bottom: -imageHeight-imageTitleSpace/2.0, right: 0);
            break;
        case .left:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -imageTitleSpace/2.0, bottom: 0, right: imageTitleSpace/2.0);
            labelEdgeInsets = UIEdgeInsets(top: 0, left: imageTitleSpace/2.0, bottom: 0, right: -imageTitleSpace/2.0);
            break;
        case .bottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-imageTitleSpace/2.0, right: -labelWidth);
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight-imageTitleSpace/2.0, left: -imageWidth, bottom: 0, right: 0);
            break;
        case .right:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+imageTitleSpace/2.0, bottom: 0, right: -labelWidth-imageTitleSpace/2.0);
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth-imageTitleSpace/2.0, bottom: 0, right: imageWidth+imageTitleSpace/2.0);
            break;
        }
        
        // 4. 赋值
        self.titleEdgeInsets = labelEdgeInsets;
        self.imageEdgeInsets = imageEdgeInsets;
        
    }
    
}
