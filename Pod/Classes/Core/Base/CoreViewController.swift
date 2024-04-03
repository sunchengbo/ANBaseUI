//
//  CoreViewController.swift
//  ANBaseUI
//
//  Created by iOS on 2019/5/6.
//

import UIKit
import MJRefresh

// Mark:// 如果需要自定义 重写掉core里面的方法即可

public enum CoreRefreshStyle {
    case onlyHeader //只刷新头
    case onlyFooter //只刷新尾
    case headerAndFooter //都刷新
}

public enum CoreBackIconStyle {
    case white //白色箭头
    case black //黑色箭头
    case custom //自定义
}

open class CoreViewController: UIViewController {

    public lazy var backBarDefaultItem = UIBarButtonItem.init(image: UIImage(imageNameByBundle: "white_back").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(goBack))
    
    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setNavLeftItem()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    public func setAdjustsScrollInsets(_ scrollView: UIScrollView) {
        
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    public func getBackBarDefaultItem(_ style: CoreBackIconStyle,_ imageName: String?,_ bundle: Bundle?) -> UIBarButtonItem {
        switch style {
        case .white:
            return UIBarButtonItem(image: UIImage(imageNameByBundle: "white_back"), style: .plain, target: self, action: #selector(goBack))
        case .black:
            return UIBarButtonItem(image: UIImage(named: "black_back"), style: .plain, target: self, action: #selector(goBack))
        case .custom:
            if let name = imageName {
                return UIBarButtonItem(image: UIImage(named: name, in: bundle, compatibleWith: nil), style: .plain, target: self, action: #selector(goBack))
            } else {
                assert(true, "自定义custom icon需要提供图片名")
                return UIBarButtonItem()
            }
        }
    }
    
    /// 设置左侧返回按钮 如有改动重写此方法
    open func setNavLeftItem() {
        
        if let vcArr = self.navigationController?.viewControllers {
            if vcArr.count > 1 { //大于1个vc在栈里 设置返回按钮
                navigationItem.leftBarButtonItem = backBarDefaultItem
            }
        }
        
    }
    
    /// 导航栏左侧按钮点击返回响应的方法 如果有不同的返回逻辑 重写即可
    @objc open func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    /// 设置一些列表的刷新
    ///
    /// - Parameters:
    ///   - scrollView: 需要刷新的视图
    ///   - style: 刷新需要的头尾类型
    open func setRefreshView(_ scrollView: UIScrollView,_ style: CoreRefreshStyle = .headerAndFooter) {
        switch style {
        case .onlyHeader:
            self.setScrollHeader(scrollView)
        case .onlyFooter:
            self.setScrollFooter(scrollView)
        case .headerAndFooter:
            self.setScrollHeader(scrollView)
            self.setScrollFooter(scrollView)
        }
    }
    
    private func setScrollHeader(_ scrollView: UIScrollView) {
        scrollView.mj_header = MJRefreshHeader(refreshingBlock: { [unowned self] in
            self.headerRefresh()
        })
    }
    
    private func setScrollFooter(_ scrollView: UIScrollView) {
        scrollView.mj_footer = MJRefreshFooter(refreshingBlock: { [unowned self] in
            self.footerRefresh()
        })
    }
    
    
    /// 头部刷新响应的方法 子类重写实现即可
    open func headerRefresh() {}
    
    /// 尾部刷新响应的方法 子类重写即可
    open func footerRefresh() {}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
