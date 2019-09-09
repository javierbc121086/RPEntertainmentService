//
//  RPETvShowService.swift
//  RPEntertainmentService
//
//  Created by Javier Bolaños on 9/9/19.
//  Copyright © 2019 gipsyhub. All rights reserved.
//

import GNSwissRazor

public protocol RPETvShowServiceDelegate: RPEBaseServiceDelegate {
    func dataResponseService(response: RPETvShowResponseEntity)
}

class RPETvShowService: RPEBaseService {
    
    private var loginServiceDelegate: RPETvShowServiceDelegate? {
        return self.delegate as? RPETvShowServiceDelegate
    }
    
    override public func parseJson(uniqueIdentifierFlow: Int, rawDic: NSDictionary) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            if let theJSONData = try? JSONSerialization.data(withJSONObject: rawDic, options: []) {
                let decoded = try decoder.decode(RPETvShowResponseEntity.self, from: theJSONData)
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
