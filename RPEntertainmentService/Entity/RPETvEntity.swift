//
//  RPETvEntity.swift
//  RPEntertainmentService
//
//  Created by Javier Bolaños on 9/9/19.
//  Copyright © 2019 gipsyhub. All rights reserved.
//

public struct RPETvEntity: Codable {
    public var originalName: String
    public var genreIds: [Int]
    public var name: String
    public var popularity: Double
    public var originCountry: [String]
    public var voteCount: Int
    public var firstAirDate: String
    public var backdropPath: String?
    public var originalLanguage: String
    public var id: Int
    public var voteAverage: Double
    public var overview: String
    public var posterPath: String?
}
