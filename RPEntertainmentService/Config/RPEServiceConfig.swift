//
//  RPEServiceConfig.swift
//  RPEntertainmentService
//
//  Created by Javier Bolaños on 9/8/19.
//  Copyright © 2019 gipsyhub. All rights reserved.
//

import GNNetworkServices

public struct RPEServiceConfig {
    /**
     MOVIE
     */
    public static let movie_popular
        = GNDependencySeriveConfig.GetIdentifierRestServer.getUrl().appending("/4/discover/movie?sort_by=popularity.desc")
    public static let movie_rated
        = GNDependencySeriveConfig.GetIdentifierRestServer.getUrl().appending("/4/discover/movie/?sort_by=vote_average.desc")
    public static let movie_upcoming
        = GNDependencySeriveConfig.GetIdentifierRestServer.getUrl().appending("/3/movie/upcoming?api_key=%@&page=1")
    
    /**
     TV_SHOW
     */
    public static let tv_show_popular
        = GNDependencySeriveConfig.GetIdentifierRestServer.getUrl().appending("/3/tv/popular?api_key=%@&page=1")
    public static let tv_show_rated
        = GNDependencySeriveConfig.GetIdentifierRestServer.getUrl().appending("/3/tv/top_rated?api_key=%@&page=1")
    public static let tv_show_upcoming
        = GNDependencySeriveConfig.GetIdentifierRestServer.getUrl().appending("")
}
