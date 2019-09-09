//
//  RPEHelperTest.swift
//  RPEntertainmentServiceTests
//
//  Created by Javier Bolaños on 9/8/19.
//  Copyright © 2019 gipsyhub. All rights reserved.
//

import GNNetworkServices

/**
 Estructura global que nos permite definir parametros de configuracion sobre el core
 **GNNetworkServices**
 */
class RPEHelperTest: NSObject {
    
    /**
     Propiedad encargada de proveer la tecnologia a ejecurar sobre el core GNNetworkServices
     
     ## Nota##
     Re recomienda elegir una ocion valida desde el tipo GNConnectionType, de lo contrario,
     el core GNNetworkServices no podra obtener un core valido y las referencias seran nulas
     */
    class var MockIdentifierCoreService: Int {
        return GNConnectionType.NSURLSessionService.rawValue
    }
}
