//
//  HomeApiService.swift
//  MountainSeacustomerNew
//
//  Created by 苏苏咯 on 2017/6/13.
//  Copyright © 2017年 shanHaiBian. All rights reserved.
//

import UIKit
import Moya
private let URL_HOME = "/shb_mobile_new_web/roomInfo/queryRoomInfoPage"
enum Result {
    case ok(message: String)
    case empty
    case failed(message: String)
    
}
internal final class AccessTokenPlugin: PluginType {
    func willSend(_ request: RequestType, target: TargetType) {
        //请求前
    }
    
 
    func didReceive(_ result: Result, target: TargetType) {
        //请求后
    }
    
    
}
let HomeApiServi = RxMoyaProvider<HomeApiServicea>(plugins: [AccessTokenPlugin()])
public enum HomeApiServicea {
    case getHome(city:String)//需要传的参数
    case PictureSave(token:String,picture:Data)
    
}
extension HomeApiServicea: TargetType {
    public var baseURL: URL {
        return URL(string: "192.168....")!
    }
    
    public var path: String {
        switch self {
        case .getHome:
            return URL_HOME
        case .PictureSave:
            return "......"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getHome:
            return .get
        case .PictureSave:
            return .post
            
        }
    }
    
    public var parameters: [String : Any]?
    {
        switch self {
        case .getHome(let cityname):
            return ["cityName":cityname]
        case .PictureSave(let token):
            return ["token":token]
        }
    }
    
    public var parameterEncoding: ParameterEncoding {
        switch self {
        case .getHome:
            return URLEncoding.default
        case .PictureSave:
            return URLEncoding.default
        }
    }
    
    public var task: Task {
        switch self {
        case .getHome:
            return .request
        case let . PictureSave(_,Data):
            return .upload(.multipart([MultipartFormData(provider: .data(Data), name: "files",fileName: "pic.jpeg", mimeType: "image/jpeg")]))
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .getHome:
            return "".data(using: String.Encoding.utf8)!
        case .PictureSave:
            return "".data(using: String.Encoding.utf8)!
        }
    }
}

