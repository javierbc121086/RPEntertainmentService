//
//  RPEMovieModel.swift
//  RPEntertainmentService
//
//  Created by Javier Bolaños on 9/8/19.
//  Copyright © 2019 gipsyhub. All rights reserved.
//

struct RPEMovieEntity: Codable {
    var popularity: Double
    var voteCount: Int
    var video: Bool
    var posterPath: String?
    var id: Int
    var adult: Bool
    var backdropPath: String?
    var originalLanguage: String
    var originalTitle: String
    var genreIds: [Int]
    var title: String
    var voteAverage: Double
    var overview: String
    var releaseDate: String
}
