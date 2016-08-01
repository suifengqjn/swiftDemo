//
//  TBVisitorView.swift
//  Sina
//
//  Created by qianjn on 16/7/31.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

///swift 中如何定义协议
protocol TBVisitorViewDelegate: NSObjectProtocol {
    //登入代理
    func loginBtnClick()
    
    //登入代理
    func registerBtnClick()
}

class TBVisitorView: UIView {
    
    
    ///定义一个属性保存代理对象 , 一定要加上weak
    weak var delegate: TBVisitorViewDelegate?
    

    
    /**
     设置未登录界面
     
     :param: isHome    是否是首页
     :param: imageName 需要展示的图标名称
     :param: message   需要展示的文本内容
     */
    
    func setupVisitorInfo(_ isHome: Bool, imageName: String, message: String){
        
        
        iconView.isHidden = !isHome
        messageLabel.text = message
        homeIconView.image = UIImage(named: imageName)
        
        if isHome{
            startAnimation()
        }
    }
    
   override init(frame: CGRect) {
    
    super.init(frame: frame)
    
        setupUI()
    
    }
    
    
    //swift 要么用纯代码， 要么用xib
    //所以重写init 就必须重写coder
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
    
    /**
     开始动画
     */
    private func startAnimation(){
        // 1.创建动画
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        // 2.设置动画属性
        anim.toValue = 2 * M_PI
        anim.duration = 20
        anim.repeatCount = MAXFLOAT
        // true 动画执行完后默认会从图层删除掉
        // false 下次你在通过-set 方法设定动画的属性时,它将再次使用你的动画,而非默认的动画
        anim.isRemovedOnCompletion = false
        // 3.添加动画
        iconView.layer.add(anim, forKey: nil)
    }
    
    /**
     初始化UI
     */
    private func setupUI(){
        // 1. 添加控件
        addSubview(iconView)
        addSubview(maskIconView)
        addSubview(homeIconView)
        addSubview(messageLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        
        // 2. 自动布局
        /*
         注意:
         纯代码开发时默认可以直接使用setFrame设置控件位置的
         如果要使用自动布局，需要设置translatesAutoresizingMaskIntoConstraints属性
         一旦加入自动布局系统管理，就不要再设置frame
         */
        // 2.1背景图标
        iconView.xmg_AlignInner(type: XC_AlignType.center, referView: self, size: nil)
        // 2.2遮罩
        maskIconView.xmg_Fill(self)
        // 2.3小房子
        homeIconView.xmg_AlignInner(type: XC_AlignType.center, referView: self, size: nil)
        // 2.4消息文字
        messageLabel.xmg_AlignVertical(type: XC_AlignType.bottomCenter, referView: iconView, size: nil)
        addConstraint(NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 224))
        // 2.5注册按钮
        registerButton.xmg_AlignVertical(type: XC_AlignType.bottomLeft, referView: messageLabel, size: CGSize(width: 100, height: 35), offset: CGPoint(x: 0, y: 20))
        // 2.6登录按钮
        loginButton.xmg_AlignVertical(type: XC_AlignType.bottomRight, referView: messageLabel, size: CGSize(width: 100, height: 35), offset: CGPoint(x: 0, y: 20))
    }

    
    //MARK: - 按钮点击事件
    func registerBtnClick() {
        delegate?.registerBtnClick()
    }
    
    func loginBtnClick() {
        delegate?.loginBtnClick()
    }
    
    // MARK: - 懒加载控件
    /// 背景图标
    private lazy var iconView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        return iv
    }()
    
    /// 遮罩视图
    // 注意系统有一个叫做maskView的属性, 属性名称不能叫做maskView
    private lazy var maskIconView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
        
        return iv
    }()
    
    /// 小房子
    private lazy var homeIconView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        return iv
    }()
    
    /// 消息文字
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "关注一些人，回这里看看有什么惊喜"
        label.textColor = UIColor.darkGray()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    /// 注册按钮
    private lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("注册", for: UIControlState())
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: UIControlState())
        btn.setTitleColor(UIColor.orange(), for: UIControlState())
        
        // 注册监听
        btn.addTarget(self, action: #selector(registerBtnClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
    
    /// 登录按钮
    private lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("登录", for: UIControlState())
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: UIControlState())
        btn.setTitleColor(UIColor.orange(), for: UIControlState())
        
        // 注册监听
        btn.addTarget(self, action: #selector(loginBtnClick), for: UIControlEvents.touchUpInside)
        return btn
    }()
}
