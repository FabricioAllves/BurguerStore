//
//  SignUpState.swift
//  BurguerStore
//
//  Created by Fabricio Henrique on 06/08/24.
//

import Foundation

enum SignUpState {
    case none
    case loading
    case goToHome
    case error(String)
}
