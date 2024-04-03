//
//  String+Extension.swift
//  ANBaseUI
//
//  Created by Ackerman on 2019/5/16.
//

import Foundation

//用法  https://www.jianshu.com/p/f2ec98acb13b
public extension NSMutableAttributedString {
    /// 获取范围
    func hw_allRange() -> NSRange {
        return NSMakeRange(0,length)
    }
    /// 添加中划线
    @discardableResult
    func hw_addMidline(_ lineHeght: Int) -> NSMutableAttributedString {
        addAttributes([.strikethroughStyle:lineHeght], range: hw_allRange())
        return self
    }
    /// 中划线颜色
    @discardableResult
    func hw_midlineColor(_ color: UIColor) -> NSMutableAttributedString{
        addAttributes([.strikethroughColor:color], range: hw_allRange())
        return self
    }
    /// 给文字添加描边
    ///
    /// - Parameter width: 描边宽带
    /// - Returns:
    @discardableResult
    func hw_addStroke(_ width: CGFloat) -> NSMutableAttributedString {
        addAttributes([.strokeWidth:width], range: hw_allRange())
        return self
    }
    /// 描边颜色
    @discardableResult
    func hw_strokeColor(_ color: UIColor) -> NSMutableAttributedString {
        addAttributes([.strokeColor:color], range: hw_allRange())
        return self
    }
    
    /// 添加字间距
    @discardableResult
    func hw_addSpace(_ space: CGFloat) -> NSMutableAttributedString {
        addAttributes([.kern:space], range: hw_allRange())
        return self
    }
    /// 背景色
    @discardableResult
    func hw_backgroundColor(_ color: UIColor) -> NSMutableAttributedString {
        addAttributes([.backgroundColor:color], range: hw_allRange())
        return self
    }
    /// 文字颜色
    @discardableResult
    public func hw_color(_ color: UIColor) -> NSMutableAttributedString {
        addAttributes([.foregroundColor:color], range: hw_allRange())
        return self
    }
    
    /// 添加下划线
    ///
    /// - Parameter style: <#style description#>
    /// - Returns: <#return value description#>
    @discardableResult
    func hw_addUnderLine(_ style: NSUnderlineStyle) -> NSMutableAttributedString{
        addAttributes([.underlineStyle:style.rawValue], range: hw_allRange())
        return self
    }
    /// 下划线颜色
    @discardableResult
    func hw_underLineColor(_ color: UIColor) -> NSMutableAttributedString{
        addAttributes([.underlineColor:color], range: hw_allRange())
        return self
    }
    
    /// 字体
    @discardableResult
    func hw_font(_ font: UIFont) -> NSMutableAttributedString{
        addAttributes([.font:font], range: hw_allRange())
        return self
    }
    /// 系统字体大小
    @discardableResult
    func hw_fontSize(_ size: CGFloat)->NSMutableAttributedString{
        addAttributes([.font:UIFont.systemFont(ofSize: size)], range: hw_allRange())
        return self
    }
    
    /// 添加行间距
    @discardableResult
    func hw_addLineSpace(_ space: CGFloat) -> NSMutableAttributedString {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = space
        style.lineBreakMode = .byCharWrapping
        addAttribute(.paragraphStyle, value: style, range: hw_allRange())
        return self
    }
    
    /// 添加 aliment
    @discardableResult
    func hw_addAligment(_ aligment: NSTextAlignment) -> NSMutableAttributedString {
        let style = NSMutableParagraphStyle()
        style.alignment = aligment
        addAttribute(.paragraphStyle, value: style, range: hw_allRange())
        return self
    }
    
    /// 拼接富文本
    @discardableResult
    func hw_addAttribute(_ attribute: NSMutableAttributedString) -> NSMutableAttributedString {
        append(attribute)
        return self
    }
    
    /// 添加阴影
    @discardableResult
    func hw_addShadow(_ shadowOffset:CGSize? = nil ,_ color: UIColor? = nil) -> NSMutableAttributedString {
        let shadow = NSShadow.init()
        shadow.shadowColor = color == nil ? UIColor.black : color!
        shadow.shadowOffset = shadowOffset == nil ? CGSize.init(width: 2, height: 2) : shadowOffset!
        addAttributes([NSAttributedString.Key.shadow: shadow], range: hw_allRange())
        return self
    }
}


public extension String {
    /// 字符串转富文本
    func hw_toAttribute() -> NSMutableAttributedString {
        return NSMutableAttributedString(string: self)
    }
    
    func xb_stringToDict() -> [String: Any]
    {
        let jsonData:Data = self.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            
            if dict is Dictionary<String, Any>
            {
                return dict as! [String : Any];
            }
        }
        return [:]
    }
    
    func xb_stringToArray() -> [Any]
    {
        let jsonData:Data = self.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            
            if dict is [Any]
            {
                return dict as! [Any];
            }
        }
        return []
    }
    
    func xb_stringHeight(font: UIFont, maxWidth:CGFloat) -> CGFloat {
        let str: NSString = self as NSString
        let size = CGSize.init(width: maxWidth, height: 10000)
        let dic = [NSAttributedString.Key.font: font]
        let strSize = str.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic, context: nil).size
        return strSize.height
    }
    
    func xb_stringWidth(font: UIFont, maxHeight:CGFloat) -> CGFloat {
        let str: NSString = self as NSString
        let size = CGSize.init(width: 10000, height: maxHeight)
        let dic = [NSAttributedString.Key.font: font]
        let strSize = str.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic, context: nil).size
        return strSize.width
    }
}
