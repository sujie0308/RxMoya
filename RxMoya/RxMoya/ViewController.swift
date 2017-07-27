//
//  ViewController.swift
//  RxMoya
//
//  Created by 苏苏咯 on 2017/6/25.
//  Copyright © 2017年 sujie. All rights reserved.
//

import UIKit
import RxSwift
class ViewController: UIViewController {
 let disposeBag = DisposeBag()
      let homePageviewRequest = HomePageViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
     //上传照片
       homePageviewRequest.MyCenter(city: "123").subscribe(onNext: { (Response) in
         //解析
       }, onError: { (error) in
        
       }, onCompleted: { 
        //请求成功下一步操作
       }, onDisposed: {
        
       }).addDisposableTo(disposeBag)
        let data = UIImageJPEGRepresentation(UIImage.init(named: "")!, 0.5)
        HomeApiServi.request(.PictureSave(token: "96e79218965eb72c92a549dd5a330112", picture: data!)).subscribe(onNext: { (Response) in
            //let data = JSON(data: Response.data)  swift json
         
        }, onError: { (error) in
            
        }, onCompleted: {
            
        }, onDisposed: {
            
        }).addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

