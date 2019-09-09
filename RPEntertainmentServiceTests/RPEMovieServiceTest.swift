//
//  RPEMovieServiceTest.swift
//  RPEntertainmentServiceTests
//
//  Created by Javier Bolaños on 9/8/19.
//  Copyright © 2019 gipsyhub. All rights reserved.
//

import XCTest
import GNNetworkServices

@testable import RPEntertainmentService

class RPEMovieServiceTest: XCTestCase, RPEMovieServiceDelegate {
    
    private var _movieService: RPEMovieService?
    private var _expectation: XCTestExpectation?
    
    private var _isFailed = false
    
    override func setUp() {
        super.setUp()
        
        _isFailed = false
        
        _movieService = RPEMovieService(identifierService:
            RPEHelperTest.MockIdentifierCoreService)
        _movieService?.delegate = self
    }
    
    override func tearDown() {
        super.tearDown()
        
        _movieService?.removeReferenceContext()
        _movieService = nil
        
        _expectation = nil
    }
    
    /****************************************************************
     ** Prueba que ejecuta el servicio Popularity Movier Exitosamente **
     ****************************************************************/
    func testGetPopularityMoviesSuccess() {
        _expectation = expectation(description: "::: Register new user")
        
        _movieService?.httpGetRest(
            url: RPEServiceConfig.movie_popular,
            extraHeaders: RPELoginMock.SessionHeader,
            gnRequestType: RPEHttpRequestType.MOVIE_POPULAR.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /****************************************************************
     ** Prueba que ejecuta el servicio Rate Movier Exitosamente **
     ****************************************************************/
    func testGetRateMoviesSuccess() {
        _expectation = expectation(description: "::: Register new user")
        
        _movieService?.httpGetRest(
            url: RPEServiceConfig.movie_rated,
            extraHeaders: RPELoginMock.SessionHeader,
            gnRequestType: RPEHttpRequestType.MOVIE_RATE.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /****************************************************************
     ** Prueba que ejecuta el servicio Rate Movier Exitosamente **
     ****************************************************************/
    func testGetUpcomingMoviesSuccess() {
        _expectation = expectation(description: "::: Register new user")
        
        let tokenUrl = String(format: RPEServiceConfig.movie_upcoming, RPELoginMock.apiToken)
        _movieService?.httpGetRest(
            url: tokenUrl,
            extraHeaders: nil,
            gnRequestType: RPEHttpRequestType.MOVIE_RATE.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    func dataResponseService(response: RPEMovieResponseEntity) {
        _expectation?.fulfill()
            
        if _isFailed {
            XCTFail("\n::: Error: Service Register should fail !!")
        }
        else {
            XCTAssertTrue(response.results.isNotEmpty)
        }
    }
    
    func requestFailWithError(error: Error) {
        _expectation?.fulfill()
        
        if _isFailed {
            XCTAssert(!error.localizedDescription.isEmpty)
        }
        else {
            XCTFail("\n::: Error: \(error.localizedDescription)")
        }
    }

}
