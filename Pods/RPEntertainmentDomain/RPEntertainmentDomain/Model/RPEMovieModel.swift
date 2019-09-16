//
//  RPEMovieModel.swift
//  RPEntertainmentService
//
//  Created by Javier Bolaños on 9/11/19.
//  Copyright © 2019 gipsyhub. All rights reserved.
//

public struct RPEMovieModel {
    public var id: Int
    public var popularity: Double
    public var voteCount: Int
    public var video: Bool
    public var adult: Bool
    public var originalLanguage: String
    public var originalTitle: String
    public var genreIds: [Int]
    public var title: String
    public var voteAverage: Double
    public var overview: String
    public var releaseDate: String
    
    public var backdropPath: String
    public var posterPath: String
    
    public init(id: Int,
                popularity: Double,
                voteCount: Int,
                video: Bool,
                adult: Bool,
                originalLanguage: String,
                originalTitle: String,
                genreIds: [Int],
                title: String,
                voteAverage: Double,
                overview: String,
                releaseDate: String,
                backdropPath: String,
                posterPath: String
    ) {
        self.id                 = id
        self.popularity         = popularity
        self.voteCount          = voteCount
        self.video              = video
        self.adult              = adult
        self.originalLanguage   = originalLanguage
        self.originalTitle      = originalTitle
        self.genreIds           = genreIds
        self.title              = title
        self.voteAverage        = voteAverage
        self.overview           = overview
        self.releaseDate        = releaseDate
        self.backdropPath       = backdropPath
        self.posterPath         = posterPath
    }
}
