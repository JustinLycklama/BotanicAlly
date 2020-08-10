//
//  Trefle.swift
//  FlowerFinder
//
//  Created by Justin Lycklama on 2020-08-07.
//  Copyright © 2020 Justin Lycklama. All rights reserved.
//

import Foundation
import Moya
import Alamofire

import ObjectMapper
import Moya_ObjectMapper

class Trefle {
    static let API_KEY = "eai2dyDtyGIsT5vbp5kw4VO0aNGdQGe7VD0TDJt-yxQ"
    static let provider = MoyaProvider<TrefleTarget>(plugins: [NetworkLoggerPlugin()])
    
    static func request() {
        
        let target = TrefleTarget()
        
        provider.request(target) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let statusCode = moyaResponse.statusCode
                // do something with the response data or statusCode
                
                
                    if let returnString = String.init(data: data, encoding: .utf8) {
                        print("-----\n", self, #line, " ", #file, " ", returnString)
                    }
                
                do {
//                    let repos: [Plant] = try moyaResponse.mapArray(Plant.self)

                    
                    let env = try moyaResponse.mapObject(Envelope<Plant>.self)
                        
                    print("Hi")
                    
                } catch {
                }
                
                
                
            case let .failure(error):
                break
                // this means there was a network failure - either the request
                // wasn't sent (connectivity), or no response was received (server
                // timed out).  If the server responds with a 4xx or 5xx error, that
                // will be sent as a ".success"-ful response.
            }
        }
    }
    
    class TrefleTarget: TargetType {
        
        let base = URL(string: "https://trefle.io/api/v1/")!
        
        var baseURL: URL {
            return base
        }
        
        var path: String {
            return "plants"
        }
        
        var method: Moya.Method {
            return .get
        }
        
        var sampleData: Data {
            return Data()
        }
        
        var task: Task {
            return Task.requestParameters(parameters: ["token" : API_KEY], encoding: URLEncoding.default)
        }
        
        var headers: [String : String]? {
//            return ["token" : API_KEY]
            return nil
        }
        
    }
}

struct Plant : IdentifiableMappable {
    var id: Id!

    var rank : String?
    var scientificName: String?
    
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- (map["id"], Id.transform)
        
        rank <- map["rank"]
        scientificName <- map["scientific_name"]
    }
    
    
}

public struct GenericIdentifier<T>: RawRepresentable, Hashable, Equatable {
    public let rawValue: Int
    public var hashValue: Int { get { return rawValue } }
    
    public init(rawValue: Int) { self.rawValue = rawValue }
    
}

public extension GenericIdentifier where T: IdentifiableMappable {
    static var transform: TransformOf<GenericIdentifier<T>, Int> {
        get {
            return TransformOf<GenericIdentifier<T>, Int>(fromJSON: { (primaryKey: Int?) -> GenericIdentifier<T>? in
                if let primaryKey = primaryKey {
                    return GenericIdentifier<T>(rawValue: primaryKey)
                }
                return nil
            }, toJSON: { (genericIdentifier: GenericIdentifier<T>?) -> Int? in
                if let genericIdentifier = genericIdentifier {
                    return genericIdentifier.rawValue
                }
                
                return nil
            })
        }

    }
}

public protocol IdentifiableMappable: Mappable, Hashable {
    typealias Id = GenericIdentifier<Self>

    var id: Id! { get }
}

extension Mappable where Self: IdentifiableMappable {
    public var hashValue: Int { get { return id.rawValue.hashValue } }
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.id.rawValue == rhs.id.rawValue
    }
}

struct Envelope<T: Mappable>: Mappable {

    
    var responseList: [T]?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        // For now, force the selection of the first element. Won't be like that in the future.
        responseList <- map["data"]
    }
}
