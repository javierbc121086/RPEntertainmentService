//
// Created by Javier Bolaños on 9/13/19.
// Copyright (c) 2019 gipsyhub. All rights reserved.
//

import RPEntertainmentDomain

public struct RPETvEntityModelConverter {

    public static func entityToModel(entity: RPETvEntity) -> RPETvModel {
        let model = RPETvModel(
                id: entity.id,
                originalName: entity.originalName,
                genreIds: entity.genreIds,
                name: entity.name,
                popularity: entity.popularity,
                originCountry: entity.originCountry,
                voteCount: entity.voteCount,
                firstAirDate: entity.firstAirDate,
                backdropPath: entity.backdropPath ?? "",
                originalLanguage: entity.originalLanguage,
                voteAverage: entity.voteAverage,
                overview: entity.overview,
                posterPath: entity.posterPath ?? ""
        )

        return model
    }
}
