//
//  CommentRouter.swift
//  BudgetBuddies
//
//  Created by 김승원 on 8/17/24.
//

import Foundation
import Moya

enum CommentRouter {
    case getDiscountsComments(discountInfoId: Int, request: CommentRequest)
    case getSupportsComments(supportInfoId: Int, request: CommentRequest)
    case addDiscountsComments(userId: Int, request: DiscountsCommentsRequestDTO)
    case addSupportsComments(userId: Int, request: SupportsCommentsRequestDTO)
}

extension CommentRouter: TargetType {
    var baseURL: URL {
        return URL(string: ServerInfo.baseURL)!
    }

    var path: String {
        switch self {
        case .getDiscountsComments(let discountInfoId, _):
            return "/discounts/\(discountInfoId)/comments"
            
        case .getSupportsComments(let supportInfoId, _):
            return "/supports/\(supportInfoId)/comments"
            
        case .addDiscountsComments:
            return "discounts/comments"
            
        case .addSupportsComments:
            return "supports/comments"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getDiscountsComments:
            return .get
            
        case .getSupportsComments:
            return .get
            
        case .addDiscountsComments:
            return .post
            
        case .addSupportsComments:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getDiscountsComments(_, let request):
            let parameters: [String: Any] = [
                "page": request.page,
                "size": request.size
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
            
        case .getSupportsComments(_, let request):
            let parameters: [String: Any] = [
                "page": request.page,
                "size": request.size
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
            
            
        case .addDiscountsComments(userId: let userId, request: let request):
            return .requestCompositeParameters(
                bodyParameters: try! request.asDictionary(),
                bodyEncoding: JSONEncoding.default,
                urlParameters: ["userId": userId]
            )
            
        case .addSupportsComments(userId: let userId, request: let request):
            return .requestCompositeParameters(
                bodyParameters: try! request.asDictionary(),
                bodyEncoding: JSONEncoding.default,
                urlParameters: ["userId": userId]
            )
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
