//
//  RPEMovieResponseEntity.swift
//  RPEntertainmentService
//
//  Created by Javier Bolaños on 9/9/19.
//  Copyright © 2019 gipsyhub. All rights reserved.
//

public struct RPEMovieResponseEntity: Codable {
    public var page: Int
    public var totalResults: Int
    public var totalPages: Int
    public var results: [RPEMovieEntity]
}
