//
//  RPEServiceConfig.swift
//  RPEntertainmentService
//
//  Created by Javier Bolaños on 9/8/19.
//  Copyright © 2019 gipsyhub. All rights reserved.
//

import GNNetworkServices

public struct RPEServiceConfig {
    public static let login = GNDependencySeriveConfig.GetIdentifierRestServer.getUrl().appending("/login/v1/authenticate")
}
