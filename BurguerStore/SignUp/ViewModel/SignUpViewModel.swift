//
//  SignUpViewModel.swift
//  BurguerStore
//
//  Created by Fabricio Henrique on 06/08/24.
//

import Foundation


protocol SignUpViewModelDelegate {
    func viewModelDidChanged(state: SignUpState)
}

class SignUpViewModel {
    
    var delegate: SignUpViewModelDelegate?
    var coordinator: SignUpCoordinator?
    
    var state: SignUpState = .none {
        didSet {
            delegate?.viewModelDidChanged(state: state)
        }
    }
    
    func send (){
        state = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.state = .goToHome
        }
    }
    
    func goToHome(){
        coordinator?.home()
    }
    
}
