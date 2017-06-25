
//
//  HomePageViewModel.swift
//  MountainSeacustomerNew
//
//  Created by 苏苏咯 on 2017/6/19.
//  Copyright © 2017年 shanHaiBian. All rights reserved.
//


import Moya
import RxSwift
class HomePageViewModel{
    func MyCenter(city:String) ->Observable<Response>
    {
        return HomeApiServi.request(.getHome(city: city)).asObservable()
    }

}
