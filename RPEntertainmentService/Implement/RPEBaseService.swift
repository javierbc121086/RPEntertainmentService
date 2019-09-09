//
//  RPEBaseService.swift
//  RPEntertainmentService
//
//  Created by Javier Bolaños on 9/8/19.
//  Copyright © 2019 gipsyhub. All rights reserved.
//

import GNNetworkServices

/**
 Protocolo base que hereda la funcioanlidad del core GNNetworkServices
 
 ## Nota ##
 Todos los protocolos que hereden de **RPEBaseServiceDelegate**
 y sean implementados sobre su clase, estructura o enumeracion
 deberan asignar un valos a la propiedad **delegate**, de lo contrario
 no podran obtener las respuestas del core service por medio del patron delegado
 */
public protocol RPEBaseServiceDelegate: GNBaseServiceDelegate {
    
}

/**
 Clase base que hereda la funcioanlidad del core GNNetworkServices
 
 ## Nota ##
 Todas las clases que hereden de **RPEBaseService** deberan asignar un valos a la
 propiedad **delegate**, de lo contrario no podran obtener las respuestas del core service
 */
public class RPEBaseService: GNBaseService {

}
