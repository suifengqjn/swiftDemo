//
//  TBQRCodeController.swift
//  Sina
//
//  Created by qianjn on 16/8/8.
//  Copyright © 2016年 SF. All rights reserved.
//

import UIKit
import AVFoundation
class TBQRCodeController: UIViewController {

    @IBOutlet weak var QRTabbar: UITabBar!
    
    //冲击波视图
    @IBOutlet weak var scanView: UIImageView!
    
    //容器高度
    @IBOutlet weak var containHeight: NSLayoutConstraint!
    
    //冲击波顶部约束
    @IBOutlet weak var scanViewTop: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        QRTabbar.selectedItem = QRTabbar.items![0]
        QRTabbar.delegate = self
    }

    @IBAction func leftBtnClick(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createMyCard(_ sender: AnyObject) {
        
        let vc = TBQRCardController()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 1.开始动画
        startAnimation()
        // 2.开始扫描
        startScan()
    }
    
    func startScan() {
        // 1.判断是否能够将输入添加到会话中
        if !session.canAddInput(deviceInput)
        {
            return
        }
        // 2.判断是否能够将输出添加到会话中
        if !session.canAddOutput(output)
        {
            return
        }
        // 3.将输入和输出都添加到会话中
        session.addInput(deviceInput)
        print(output.availableMetadataObjectTypes)
        session.addOutput(output)
        print(output.availableMetadataObjectTypes)
        
        // 4.设置输出能够解析的数据类型
        // 注意: 设置能够解析的数据类型, 一定要在输出对象添加到会员之后设置, 否则会报错
        output.metadataObjectTypes =  output.availableMetadataObjectTypes
        print(output.availableMetadataObjectTypes)
        // 5.设置输出对象的代理, 只要解析成功就会通知代理
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        // 如果想实现只扫描一张图片, 那么系统自带的二维码扫描是不支持的
        // 只能设置让二维码只有出现在某一块区域才去扫描
        // output.rectOfInterest = CGRectMake(0.0, 0.0, 1, 1)
        
        // 添加预览图层
        view.layer.insertSublayer(previewLayer, at: 0)
        
        // 6.告诉session开始扫描
        session.startRunning()
    }
    private func startAnimation() {
        self.scanViewTop.constant = -self.containHeight.constant
        self.scanView.layoutIfNeeded()
        
        UIView.animate(withDuration: 3.0) {
            self.scanViewTop.constant = 0
            UIView.setAnimationRepeatCount(Float(INT_MAX))
            self.scanView.layoutIfNeeded()
            
        }
    }
    
    // MARK: - 懒加载
    // 会话
    private lazy var session : AVCaptureSession = AVCaptureSession()
    
    // 拿到输入设备
    private lazy var deviceInput: AVCaptureDeviceInput? = {
        // 获取摄像头
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        if (device == nil) {return nil}
        do{
            // 创建输入对象
            let input = try AVCaptureDeviceInput(device: device)
            return input
        }catch
        {
            print(error)
            return nil
        }
    }()

    // 拿到输出对象
    private lazy var output: AVCaptureMetadataOutput = AVCaptureMetadataOutput()
    
    // 创建预览图层
    private lazy var previewLayer: AVCaptureVideoPreviewLayer = {
        let layer = AVCaptureVideoPreviewLayer(session: self.session)
        layer!.frame = UIScreen.main().bounds
        return layer!
    }()
    
    // 创建用于绘制边线的图层
    private lazy var drawLayer: CALayer = {
        let layer = CALayer()
        layer.frame = UIScreen.main().bounds
        return layer
    }()
    
    
}



extension TBQRCodeController:UITabBarDelegate, AVCaptureMetadataOutputObjectsDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item)
        // 1. 修改容器的高度
        if item.tag == 1 {   //二维码
            self.containHeight.constant = 200
        } else {        //条形码
            self.containHeight.constant = 100
        }
        //2.停止动画
        self.scanView.layer.removeAllAnimations()
        
        //开始动画
        startAnimation()
        
    }
    
    // MARK: - 扫描后调用
    // 只要解析到数据就会调用
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, from connection: AVCaptureConnection!)
    {
        // 0.清空图层
        clearConers()

        // 注意: 要使用stringValue
        print(metadataObjects.last?.stringValue)
        
        
        
        // 2.获取扫描到的二维码的位置
        //        print(metadataObjects.last)
        // 2.1转换坐标
        for object in metadataObjects
        {
            // 2.1.1判断当前获取到的数据, 是否是机器可识别的类型
            if object is AVMetadataMachineReadableCodeObject
            {
                // 2.1.2将坐标转换界面可识别的坐标
                let codeObject = previewLayer.transformedMetadataObject(for: object as! AVMetadataObject) as! AVMetadataMachineReadableCodeObject
                //                print(codeObject)
                // 2.1.3绘制图形
                drawCorners(codeObject: codeObject)
            }
        }

        
    }

    
    
    /**
     绘制图形
     
     :param: codeObject 保存了坐标的对象
     */
    private func drawCorners(codeObject: AVMetadataMachineReadableCodeObject)
    {
        if codeObject.corners.isEmpty
        {
            return
        }
        
        // 1.创建一个图层
        let layer = CAShapeLayer()
        layer.lineWidth = 4
        layer.strokeColor = UIColor.red().cgColor
        layer.fillColor = UIColor.clear().cgColor
        
        // 2.创建路径
        //layer.path = UIBezierPath(rect: CGRect(x: 100, y: 100, width: 200, height: 200)).cgPath
        let path = UIBezierPath()
        var point = CGPoint.zero
        var index: Int = 0
        // 2.1移动到第一个点
        // print(codeObject.corners.last)
        // 从corners数组中取出第0个元素, 将这个字典中的x/y赋值给point
        
        (point).makeWithDictionaryRepresentation((codeObject.corners[index] as! CFDictionary))
        index = index + 1
        path.move(to: point)
        
        // 2.2移动到其它的点
        while index < codeObject.corners.count
        {
            (point).makeWithDictionaryRepresentation((codeObject.corners[index] as! CFDictionary))
            index = index + 1
            path.addLine(to: point)
                    }
        // 2.3关闭路径
        path.close()
        
        // 2.4绘制路径
        layer.path = path.cgPath
        
        // 3.将绘制好的图层添加到drawLayer上
        drawLayer.addSublayer(layer)
    }

    
    /**
     清空边线
     */
    private func clearConers(){
        // 1.判断drawLayer上是否有其它图层
        if drawLayer.sublayers == nil || drawLayer.sublayers?.count == 0{
            return
        }
        
        // 2.移除所有子图层
        for subLayer in drawLayer.sublayers!
        {
            subLayer.removeFromSuperlayer()
        }
    }

    
    
    
}
