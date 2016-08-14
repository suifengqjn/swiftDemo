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
        // 注意: 要使用stringValue
        print(metadataObjects.last?.stringValue)
    }

    
    
    
}
