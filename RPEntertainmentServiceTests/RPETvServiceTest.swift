//
//  RPETvServiceTest.swift
//  RPEntertainmentServiceTests
//
//  Created by Javier Bolaños on 9/9/19.
//  Copyright © 2019 gipsyhub. All rights reserved.
//

import XCTest
import GNNetworkServices
import RPEntertainmentDomain

@testable import RPEntertainmentService

/**
 Clase encargada de manejar las pruebas unitarias del flujo Tv
 */
class RPETvServiceTest: XCTestCase, RPETvServiceDelegate {
    
    private var _tvService: RPETvService?
    private var _expectation: XCTestExpectation?
    private var _isFailed = false
    
    override func setUp() {
        super.setUp()
        _isFailed = false
        _tvService = RPETvService(identifierService:
                                RPEHelperTest.MockIdentifierCoreService)
        _tvService?.delegate = self
    }
    
    override func tearDown() {
        super.tearDown()
        _tvService?.removeReferenceContext()
        _tvService = nil
        _expectation = nil
    }
    
    /**
     * SUCCESS
     */
    
    /********************************************************************
     ** Prueba que ejecuta el servicio Popularity Tv Show Exitosamente **
     ********************************************************************/
    func testGetPopularityTvShowSuccess() {
        _expectation = expectation(description: "::: Get Popularity Tv")
        
        let tokenUrl = String(
            format: RPEServiceConfig.tv_popular, RPELoginMock.apiToken
        )
        _tvService?.httpGetRest(
            url: tokenUrl,
            extraHeaders: nil,
            gnRequestType: RPEHttpRequestType.TV_POPULARITY.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /**************************************************************
     ** Prueba que ejecuta el servicio Rate Tv Show Exitosamente **
     **************************************************************/
    func testGetRateTvShowSuccess() {
        _expectation = expectation(description: "::: Get Rate Tv")
        
        let tokenUrl = String(
            format: RPEServiceConfig.tv_rated, RPELoginMock.apiToken
        )
        _tvService?.httpGetRest(
            url: tokenUrl,
            extraHeaders: RPELoginMock.SessionHeader,
            gnRequestType: RPEHttpRequestType.TV_RATE.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /******************************************************************
     ** Prueba que ejecuta el servicio Upcoming Tv Show Exitosamente **
     ******************************************************************/
    func testGetUpcomingTvShowSuccess() {
        _expectation = expectation(description: "::: Get Uncoming Tv")
        
        let tokenUrl = String(
            format: RPEServiceConfig.tv_upcoming,
            RPELoginMock.apiToken,
            RPELoginMock.dateFilter
        )
        _tvService?.httpGetRest(
            url: tokenUrl,
            extraHeaders: nil,
            gnRequestType: RPEHttpRequestType.TV_UPCOMING.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /**
     * FAIL
     */
    
    /******************************************************************
     ** Prueba que ejecuta el servicio Popularity Tv Show No Exitosa **
     ******************************************************************/
    func testGetPopularityTvShowFail() {
        _isFailed = true
        _expectation = expectation(description: "::: Fail Get Popularity Tv")
        
        _tvService?.httpGetRest(
            url: RPEServiceConfig.tv_popular,
            extraHeaders: nil,
            gnRequestType: RPEHttpRequestType.TV_POPULARITY.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /************************************************************
     ** Prueba que ejecuta el servicio Rate Tv Show No Exitosa **
     ************************************************************/
    func testGetRateTvShowFail() {
        _isFailed = true
        _expectation = expectation(description: "::: Fail Get Rate Tv")
        
        _tvService?.httpGetRest(
            url: RPEServiceConfig.tv_rated,
            extraHeaders: RPELoginMock.SessionHeader,
            gnRequestType: RPEHttpRequestType.TV_RATE.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /****************************************************************
     ** Prueba que ejecuta el servicio Upcoming Tv Show No Exitosa **
     ****************************************************************/
    func testGetUpcomingTvShowFail() {
        _isFailed = true
        _expectation = expectation(description: "::: Fail Get Uncoming Tv")
        
        _tvService?.httpGetRest(
            url: RPEServiceConfig.tv_upcoming,
            extraHeaders: nil,
            gnRequestType: RPEHttpRequestType.TV_UPCOMING.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /**
     * DELEGATES
     */
    
    /**********************
     ** RESPONSE SUCCESS **
     **********************/
    func dataResponseService(response: RPETvResponseEntity, type: RPEHttpRequestType) {
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
