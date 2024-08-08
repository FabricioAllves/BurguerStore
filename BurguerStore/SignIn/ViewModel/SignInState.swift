//
//  SignInState.swift
//  BurguerStore
//
//  Created by Fabricio Henrique on 03/08/24.
//

import Foundation


enum SignInState {
    case none
    case loading
    case goToHome
    case error(String)
}
