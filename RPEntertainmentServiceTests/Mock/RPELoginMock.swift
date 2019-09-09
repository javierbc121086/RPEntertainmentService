//
//  RPELoginMock.swift
//  RPEntertainmentServiceTests
//
//  Created by Javier Bolaños on 9/8/19.
//  Copyright © 2019 gipsyhub. All rights reserved.
//

struct RPELoginMock {
    
    private static let token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNTc1YWY0MjQzNjkxNzUwZjE2OGM5ZmE3ZGNkZmQzYyIsInN1YiI6IjVkNzU4ZmRmNTI5NGU3MDAwZWY0NmQ2MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NT-V44hdmZtqg3syj3okOe3t1Vc4LX_2ddpvvshZuCo"
    
    static var SessionHeader: [String: String] {
        return ["Authorization" : "Bearer \(token)"]
    }
    
    static let apiToken = "f575af4243691750f168c9fa7dcdfd3c"
}
