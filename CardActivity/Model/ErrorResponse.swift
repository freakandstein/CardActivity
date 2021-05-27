//
//  ErrorResponse.swift
//  CardActivity
//
//  Created by satrio.wicaksono on 11/04/21.
//

import Foundation

struct ErrorResponse: Codable, Error {
    var errorCode: String
    var errorMessage: String
}
