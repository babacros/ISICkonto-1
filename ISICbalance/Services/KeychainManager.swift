//
//  KeychainManager.swift
//  ISICbalance
//
//  Created by Rostislav Babáček on 18/03/2019.
//  Copyright © 2019 Rostislav Babáček. All rights reserved.
//

import Foundation
import ReactiveSwift
import SwiftKeychainWrapper

class KeychainManager {
    var currentUser = MutableProperty<String>("OOO")

    func saveCredentials(username: String, password: String) -> SignalProducer<(),LoginError> {
        return SignalProducer { [weak self] observer, disposable in
            let saveUsername: Bool = KeychainWrapper.standard.set(username, forKey: "username")
            let savePassword: Bool = KeychainWrapper.standard.set(password, forKey: "password")

            if saveUsername && savePassword {
                observer.sendCompleted()
            } else {
                observer.send(error: LoginError.keychainCredentialsFailed)
            }
        }
    }

    func getCredentialsFromKeychain() -> (username: String, password: String) {
        let username = KeychainWrapper.standard.string(forKey: "username") ?? ""
        let password = KeychainWrapper.standard.string(forKey: "password") ?? ""

        return (username: username, password: password)
    }
}