//
//  KeyChainManager.swift
//  KeyChainTestTask
//
//  Created by Сергей Горбачёв on 12.10.2021.
//

import Foundation
import KeychainAccess

class KeyChainManager {
    
    static let shared = KeyChainManager()
    
    private init() {}
    
    func saveUser(login: String, password: String) {
        
        let keychain = Keychain(service: "User")
        keychain[login] = password
        print(keychain)
    }
    
    func deleteUser() {

        let keychain = Keychain(service: "User")

        do {
            try keychain.removeAll()
        } catch let error {
            print("error: \(error.localizedDescription)")
        }
        print(keychain)
    }
    
    func loginUser() -> Bool {
        let keychain = Keychain(service: "User")
        return keychain.allKeys() != [String]() ? true : false
    }
}
