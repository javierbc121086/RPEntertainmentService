//
//  RPEMovieService.swift
//  RPEntertainmentService
//
//  Created by Javier Bolaños on 9/8/19.
//  Copyright © 2019 gipsyhub. All rights reserved.
//

import GNSwissRazor

public protocol RPEMovieServiceDelegate: RPEBaseServiceDelegate {
    func dataResponseService(response: RPEMovieResponseEntity)
}

class RPEMovieService: RPEBaseService {
    
    private var loginServiceDelegate: RPEMovieServiceDelegate? {
        return self.delegate as? RPEMovieServiceDelegate
    }
    
    override public func parseJson(uniqueIdentifierFlow: Int, rawDic: NSDictionary) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            if let theJSONData = try? JSONSerialization.data(withJSONObject: rawDic, options: []) {
                let decoded = try decoder.decode(RPEMovieResponseEntity.self, from: theJSONData)
                self.loginServiceDelegate?.dataResponseService(response: decoded)
            }
        }
        catch let error {
            self.delegate?.requestFailWithError(
                error: GNTools.MakeError(message: "RPEMovieService: Error en el formato de respuesta \(rawDic) \n \(error.localizedDescription)")
            )
        }
    }
}
