//
//  YPBottomPagerView.swift
//  YPImagePicker
//
//  Created by Sacha DSO on 24/01/2018.
//  Copyright © 2016 Yummypets. All rights reserved.
//

import UIKit
import Stevia

final class YPBottomPagerView: UIView {
    
    var header = UIView()
    var bottomView = UIView()
    var pagerMenu = YPPagerMenu()
    var scrollView = UIScrollView()
    
    convenience init() {
        self.init(frame: .zero)
        // IVAN ADD
       backgroundColor = YPConfig.colors.bottomMenuColor
        bottomView.backgroundColor = YPConfig.colors.bottomMenuColor
        
        sv(
            scrollView,
            header.sv(
                pagerMenu,
                bottomView
            )
        )
        
        var buttom: CGFloat = 0
        if #available(iOS 11.0, *) {
            buttom += 34
        }
        layout(
            0,
            |scrollView|,
            0,
            |header| ~ buttom + 44,
            0
        )
        layout(
            0,
            |pagerMenu| ~ 44,
            0,
            |bottomView| ~ buttom,
            0
        )
        
        header.heightConstraint?.constant = YPConfig.hidesBottomBar ? 0 : 44 + buttom
        
        clipsToBounds = false
        setupScrollView()
    }

    private func setupScrollView() {
        scrollView.clipsToBounds = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
    }
}
