//
//  RequestManger.swift
//  Smog test
//
//  Created by Vasyl Skop on 07/08/2021.
//

import Foundation
import Alamofire

class RequestManager {
    private let sessionManager: Session
    private let reachability = NetworkReachabilityManager()
        
    public static var defaultManager: Session {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        configuration.timeoutIntervalForResource = Constants.timeoutIntervalForResourcesInSeconds
        configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return Session(configuration: configuration)
    }
    
    let session = URLSession.shared
    
    
    public init(sessionManager: Session = RequestManager.defaultManager) {
        self.sessionManager = sessionManager
    }
    
    func makeRequest<T: Codable>(requestData: URLRequestConvertible,
                        resultType: T.Type,
                        auth: Bool = true,
                        success: @escaping (T) -> Void,
                        fail: @escaping (SmogError) -> Void) {
        
        guard let internetConnection = reachability?.isReachable, internetConnection == true else {
            fail(.noInternetConnection)
            return
        }

        let requestDataConverted = try! requestData.asURLRequest()

        self.sessionManager.request(requestDataConverted).validate().response { (response) in
            switch response.result {
            case .success(let reponseData):
                self.manageSuccessfulResponse(response: response, reponseData: reponseData, requestData: requestData, resultType: resultType, success: success, fail: fail)
            case .failure(let error):
                self.manageFailedResponse(response: response, error: error, requestData: requestData, resultType: resultType, success: success, fail: fail)
            }
        }
        
    }
    
    private func manageSuccessfulResponse<T>(response: AFDataResponse<Data?>,
                                             reponseData: Data?,
                                             requestData: URLRequestConvertible,
                                             resultType: T.Type,
                                             success: @escaping (T) -> Void,
                                             fail: @escaping (SmogError) -> Void) where T: Codable {
        guard let data = reponseData else {
            print("REQUEST FAILURE: No response data")
            fail(.noResponseData)
            return
        }
        
        guard let jsonRaw = try? JSONSerialization.jsonObject(with: data) else {
            print("REQUEST FAILURE: Response Parsing Error")
            fail(.dataParsingFailed)
            return
        }
                
        do {
            let result = try JSONDecoder().decode(resultType, from: data)
            print("REQUEST SUCCESS: \(response.request?.url?.absoluteString ?? "") BODY: \(jsonRaw)")
            success(result)
            
        } catch let error {
            print("REQUEST FAILURE: Response Parsing Error \(error.localizedDescription), original body: \(jsonRaw)")
            fail(.dataParsingFailed)
        }

    }
    
    private func manageFailedResponse<T>(response: AFDataResponse<Data?>,
                                         error: AFError,
                                         requestData: URLRequestConvertible,
                                         resultType: T.Type,
                                         success: @escaping (T) -> Void,
                                         fail: @escaping (SmogError) -> Void) {
        print("REQUEST FAILURE: \(error.localizedDescription) URL: \(response.request?.url?.absoluteString ?? "")")
        
        if let data = response.data {
            let rawError = String(data: data, encoding: .utf8)
            print("Raw Error from backend: \(rawError ?? "none")")
            fail(.unknownBackendErrorJson)
            
        } else {
            fail(.timeout)
        }
        
    }
    
    func listenForConnection(available: @escaping () -> Void) {
        reachability?.startListening(onQueue: DispatchQueue.main, onUpdatePerforming: { (status) in
            switch status {
            case .reachable:
                available()
            default:
                break
            }
        })
    }
    
}
