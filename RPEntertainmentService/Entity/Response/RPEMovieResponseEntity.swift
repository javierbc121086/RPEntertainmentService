//
//  RPEMovieResponseEntity.swift
//  RPEntertainmentService
//
//  Created by Javier Bolaños on 9/9/19.
//  Copyright © 2019 gipsyhub. All rights reserved.
//

struct RPEMovieResponseEntity: Codable {
    var page: Int
    var totalResults: Int
    var totalPages: Int
    var results: [RPEMovieEntity]
}
