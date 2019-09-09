//
//  RPELoginService.swift
//  RPEntertainmentService
//
//  Created by Javier Bolaños on 9/8/19.
//  Copyright © 2019 gipsyhub. All rights reserved.
//

public protocol RPELoginServiceDelegate: RPEBaseServiceDelegate {
    func dataResponseService(user: NSObject)
}

public class RPELoginService: RPEBaseService {
    
    private var loginServiceDelegate: RPELoginServiceDelegate? {
        return self.delegate as? RPELoginServiceDelegate
    }
    
    override public func parseJson(uniqueIdentifierFlow: Int, rawDic: NSDictionary) {
        
    }
}
