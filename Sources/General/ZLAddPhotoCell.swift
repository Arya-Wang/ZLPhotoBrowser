//
//  ZLAddPhotoCell.swift
//  ZLPhotoBrowser
//
//  Created by ruby109 on 2020/11/3.
//
//  Copyright (c) 2020 Long Zhang <495181165@qq.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit
import Foundation

class ZLAddPhotoCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let view = UIImageView(image: .zl.getImage("zl_addPhoto"))
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    deinit {
        zl_debugPrint("ZLAddPhotoCell deinit")
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: bounds.width / 2 - 10, y: 14, width: 20, height: 20)
        titleLabel.frame = CGRect(x: 0, y: CGRectGetMaxY(imageView.frame) + 4, width: bounds.width, height: 44)
        let size = titleLabel.sizeThatFits(CGSize(width: titleLabel.frame.size.width, height: CGFloat(MAXFLOAT)))
        titleLabel.frame = CGRect(x: 0, y: CGRectGetMaxY(imageView.frame) + 4, width: bounds.width, height: size.height)
    }
    
    func setupUI() {
        if ZLPhotoUIConfiguration.default().cellCornerRadio > 0 {
            layer.masksToBounds = true
            layer.cornerRadius = ZLPhotoUIConfiguration.default().cellCornerRadio
        }
        
        backgroundColor = .zl.cameraCellBgColor
        layer.borderColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1).cgColor
        layer.borderWidth = 1.0
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)

        titleLabel.text = "添加可访\n问的照片"
        titleLabel.font = UIFont(name: "PingFangSC-Regular", size: 12)  ?? UIFont.systemFont(ofSize: 12, weight: .medium)
        titleLabel.textColor = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
    }
}
