//
//  RPEMovieServiceTest.swift
//  RPEntertainmentServiceTests
//
//  Created by Javier Bolaños on 9/8/19.
//  Copyright © 2019 gipsyhub. All rights reserved.
//

import XCTest
import GNNetworkServices
import RPEntertainmentDomain

@testable import RPEntertainmentService

/**
 Clase encargada de manejar las pruebas unitarias del flujo Movie
 */
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
    
    /**
     * SUCCESS
     */
    
    /*******************************************************************
     ** Prueba que ejecuta el servicio Popularity Movies Exitosamente **
     *******************************************************************/
    func testGetPopularityMoviesSuccess() {
        _expectation = expectation(description: "::: Get Popularity Movies")
        
        _movieService?.httpGetRest(
            url: RPEServiceConfig.movie_popular,
            extraHeaders: RPELoginMock.SessionHeader,
            gnRequestType: RPEHttpRequestType.MOVIE_POPULAR.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /*************************************************************
     ** Prueba que ejecuta el servicio Rate Movies Exitosamente **
     *************************************************************/
    func testGetRateMoviesSuccess() {
        _expectation = expectation(description: "::: Get Rate Movies")
        
        _movieService?.httpGetRest(
            url: RPEServiceConfig.movie_rated,
            extraHeaders: RPELoginMock.SessionHeader,
            gnRequestType: RPEHttpRequestType.MOVIE_RATE.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /*************************************************************
     ** Prueba que ejecuta el servicio Rate Movier Exitosamente **
     *************************************************************/
    func testGetUpcomingMoviesSuccess() {
        _expectation = expectation(description: "::: Get Upcoming Movies")
        
        let tokenUrl = String(format: RPEServiceConfig.movie_upcoming, RPELoginMock.apiToken)
        _movieService?.httpGetRest(
            url: tokenUrl,
            extraHeaders: nil,
            gnRequestType: RPEHttpRequestType.MOVIE_RATE.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /**
     * FAIL
     */
    
    /*****************************************************************
     ** Prueba que ejecuta el servicio Popularity Movies No Exitoso **
     *****************************************************************/
    func testGetPopularityMoviesFail() {
        _isFailed = true
        _expectation = expectation(description: "::: Fail Get Popularity Movies")
        
        _movieService?.httpGetRest(
            url: RPEServiceConfig.movie_popular,
            extraHeaders: nil,
            gnRequestType: RPEHttpRequestType.MOVIE_POPULAR.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /***********************************************************
     ** Prueba que ejecuta el servicio Rate Movies No Exitoso **
     ***********************************************************/
    func testGetRateMoviesFail() {
        _isFailed = true
        _expectation = expectation(description: "::: Fail Get Rate Movies")
        
        _movieService?.httpGetRest(
            url: RPEServiceConfig.movie_rated,
            extraHeaders: nil,
            gnRequestType: RPEHttpRequestType.MOVIE_RATE.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /***********************************************************
     ** Prueba que ejecuta el servicio Rate Movier No Exitoso **
     ***********************************************************/
    func testGetUpcomingMoviesFail() {
        _isFailed = true
        _expectation = expectation(description: "::: Fail Get Upcoming Movies")
        
        _movieService?.httpGetRest(
            url: RPEServiceConfig.movie_upcoming,
            extraHeaders: nil,
            gnRequestType: RPEHttpRequestType.MOVIE_RATE.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /**
     * DELEGATES
     */
    
    /**********************
     ** RESPONSE SUCCESS **
     **********************/
    func dataResponseService(response: RPEMovieResponseEntity, type: RPEHttpRequestType) {
        _expectation?.fulfill()
            
        if _isFailed {
            XCTFail("\n::: Error: Service Register should fail !!")
        }
        else {
            XCTAssertTrue(response.results.isNotEmpty)
        }
    }
    
    /********************
     ** RESPONSE ERROR **
     ********************/
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
