//
//  ViewController.swift
//  KeychainHelper
//
//  Created by Atil Samancioglu on 14.01.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Writing
        let accessToken = "dummy-access-token"
        let data = Data(accessToken.utf8)
        KeychainHelper.standard.save(data, service: "access-token", account: "facebook")
        
        //Reading
        let readData = KeychainHelper.standard.read(service: "access-token", account: "facebook")!
        let readAccessToken = String(data: readData, encoding: .utf8)!
        print(readAccessToken)

        //Updating
        let anotherAccessToken = "another-dummy-access-token"
        let anotherData = Data(anotherAccessToken.utf8)
        KeychainHelper.standard.save(anotherData, service: "access-token", account: "facebook")

        //Reading Again
        let readAnotherData = KeychainHelper.standard.read(service: "access-token", account: "facebook")!
        let readAnotherAccessToken = String(data: readAnotherData, encoding: .utf8)!
        print(readAnotherAccessToken)
        
        //Deleting
        KeychainHelper.standard.delete(service: "access-token", account: "facebook")
        
        //Reading Again
        if let readLastData = KeychainHelper.standard.read(service: "access-token", account: "facebook") {
            let readLastToken = String(data: readLastData, encoding: .utf8)!
            print(readLastToken)
        }
        
        
        //Using extension generic type functions to save custom struct rather than Data
        let auth = Auth(accessToken: "dummy-access-token",
                         refreshToken: "dummy-refresh-token")

        let account = "domain.com"
        let service = "token"

        // Save `auth` to keychain
        KeychainHelper.standard.save(auth, service: service, account: account)

        // Read `auth` from keychain
        let result = KeychainHelper.standard.read(service: service, account: account, type: Auth.self)!
        print(result.accessToken)
        print(result.refreshToken)
        
        //Deleting from keyhain
        KeychainHelper.standard.delete(service: service, account: account)
        if let lastResult = KeychainHelper.standard.read(service: service, account: account, type: Auth.self) {
            print(lastResult.accessToken)
        }

        
    }


}

