//
//  TBHomePopoverAnimator.swift
//  Sina
//
//  Created by qianjn on 16/8/6.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit

let TBHomePopoverAnimatorWillPresent = "TBHomePopoverAnimatorWillPresent"
let TBHomePopoverAnimatorWillDismiss = "TBHomePopoverAnimatorWillDismiss"
class TBHomePopoverAnimator: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    /// 记录当前是否是展开
    var isPresent: Bool = false
     var presentFrame: CGRect = CGRect.zero
    //谁来实现转场动画 IOS 8 新增的方法
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let popVC = TBPopPresentationController(presentedViewController: presented, presenting: presenting)
        popVC.presentFrame = presentFrame
        return popVC
    }
    
    //modal 的展现动画
    // MARK: - 只要实现了一下方法, 那么系统自带的默认动画就没有了, "所有"东西自己来实现
    /**
     告诉系统谁来负责Modal的展现动画
     
     :param: presented  被展现视图
     :param: presenting 发起的视图
     :returns: 谁来负责（负责转场动画的对象需要遵守 UIViewControllerAnimatedTransitioning 协议）
     */
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresent = true
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: TBHomePopoverAnimatorWillPresent), object: self)
        return self
    }
    
    //modal 的消失动画
    /**
     告诉系统谁来负责Modal的消失动画
     
     :param: dismissed 被关闭的视图
     
     :returns: 谁来负责（负责转场动画的对象需要遵守 UIViewControllerAnimatedTransitioning 协议）
     */
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: TBHomePopoverAnimatorWillDismiss), object: self)
        return self;
    }
    
    
    // MARK: - UIViewControllerAnimatedTransitioning
    /**
     返回动画时长
     :param: transitionContext 上下文, 里面保存了动画需要的所有参数
     :returns: 动画时长
     */
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 0.5
    }
    
    /**
     告诉系统如何动画, 无论是展现还是消失都会调用这个方法
     :param: transitionContext 上下文, 里面保存了动画需要的所有参数
     */
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        
        ///展开
        if isPresent {
            let toVC = transitionContext.view(forKey: UITransitionContextViewKey.to)
            toVC?.transform = CGAffineTransform(scaleX: 1.0, y: 0)
            // 注意: 一定要将视图添加到容器上
            transitionContext.containerView.addSubview(toVC!)
            // 设置锚点
            toVC!.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            
            // 2.执行动画
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { () -> Void in
                // 2.1清空transform
                toVC!.transform = CGAffineTransform.identity
            }) { (_) -> Void in
                // 2.2动画执行完毕, 一定要告诉系统
                // 如果不写, 可能导致一些未知错误
                transitionContext.completeTransition(true)
            }
            
        } else {  ///收回
            let fromVC = transitionContext.view(forKey: UITransitionContextViewKey.from)
            
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { () -> Void in
                // 注意:由于CGFloat是不准确的, 所以如果写0.0会没有动画
                // 压扁
                fromVC?.transform = CGAffineTransform(scaleX: 1.0, y: 0.000001)
                }, completion: { (_) -> Void in
                    // 如果不写, 可能导致一些未知错误
                    transitionContext.completeTransition(true)
            })
            
            
        }
        
        
        
        
        
    }
    
}
