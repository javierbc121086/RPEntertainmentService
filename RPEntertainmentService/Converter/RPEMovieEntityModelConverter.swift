//
//  RPEMovieEntityModelConverter.swift
//  RPEntertainmentService
//
//  Created by Javier Bolaños on 9/16/19.
//  Copyright © 2019 gipsyhub. All rights reserved.
//

import RPEntertainmentDomain

struct RPEMovieEntityModelConverter {

    static func entityToModel(entity: RPEMovieEntity) -> RPEMovieModel {
        let model = RPEMovieModel(
            id: entity.id,
            popularity: entity.popularity,
            voteCount: entity.voteCount,
            video: entity.video,
            adult: entity.adult,
            originalLanguage: entity.originalLanguage,
            originalTitle: entity.originalTitle,
            genreIds: entity.genreIds,
            title: entity.title,
            voteAverage: entity.voteAverage,
            overview: entity.overview,
            releaseDate: entity.releaseDate,
            backdropPath: entity.backdropPath ?? "",
            posterPath: entity.posterPath ?? ""
        )
        
        return model
    }
}
