//
//  RPETvService.swift
//  RPEntertainmentService
//
//  Created by Javier Bolaños on 9/9/19.
//  Copyright © 2019 gipsyhub. All rights reserved.
//

import GNSwissRazor
import RPEntertainmentDomain

/**
 Protocolo encargado de extender el la funcionalidad
 base de RPEBaseServiceDelegate
 
 ## Funcionalidad ##
 **dataResponseService::response** es responsable de proveer información
 valida si la peticion al webservice **TV**, es satisfactoria
 */
public protocol RPETvServiceDelegate: RPEBaseServiceDelegate {
    func dataResponseService(response: [RPETvModel], type: RPEHttpRequestType)
}

/**
 Clase manejadora que se encarga de heredar y procesar las respuestas del ámbito TV
 */
public class RPETvService: RPEBaseService {
    
    /**
     Propiedad encargada de castear el protocolo base al comportamiento del ámbito TV,
     extendiendo la informacion que podemos recuperar del webservice
     */
    private var loginServiceDelegate: RPETvServiceDelegate? {
        return self.delegate as? RPETvServiceDelegate
    }
    
    /**
     Sobre escritura del comportamiento **parseJson:uniqueIdentifierFlow:rawDic**
     encargada de recibir la respuesta satiscaftoria del webservice
     
     - Parameter uniqueIdentifierFlow: Identificador unico al cual pertenece la peticion (dentro de un grupo de flujos).
     - Parameter rawDic: Diccionario que nos permite recibir la respuesta del servidor en formato llave - valor.
     */
    override public func parseJson(uniqueIdentifierFlow: Int, rawDic: NSDictionary) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            if let theJSONData = try? JSONSerialization.data(withJSONObject: rawDic, options: []) {
                let decoded = try decoder.decode(RPETvResponseEntity.self, from: theJSONData)
                var list: [RPETvModel] = []
                decoded.results.forEach { list.append(RPETvEntityModelConverter.entityToModel(entity: $0)) }
                
                self.loginServiceDelegate?.dataResponseService(
                        response: list,
                        type: RPEHttpRequestType(rawValue: uniqueIdentifierFlow) ?? RPEHttpRequestType.NONE
                )
            }
        }
        catch let error {
            self.delegate?.requestFailWithError(
                error: GNTools.MakeError(
                        message: """
                                 RPEMovieService Error: el formato de respuesta es inválido 
                                 \(rawDic) 
                                 \n 
                                 \(error.localizedDescription)
                                 """
                )
            )
        }
    }
}
