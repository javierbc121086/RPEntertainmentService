//
//  RPETvShowServiceTest.swift
//  RPEntertainmentServiceTests
//
//  Created by Javier Bolaños on 9/9/19.
//  Copyright © 2019 gipsyhub. All rights reserved.
//

import XCTest
import GNNetworkServices

@testable import RPEntertainmentService

class RPETvShowServiceTest: XCTestCase, RPETvShowServiceDelegate {

    private var _tvShowService: RPETvShowService?
    private var _expectation: XCTestExpectation?
    
    private var _isFailed = false
    
    override func setUp() {
        super.setUp()
        
        _isFailed = false
        
        _tvShowService = RPETvShowService(identifierService:
            RPEHelperTest.MockIdentifierCoreService)
        _tvShowService?.delegate = self
    }
    
    override func tearDown() {
        super.tearDown()
        
        _tvShowService?.removeReferenceContext()
        _tvShowService = nil
        
        _expectation = nil
    }
    
    /********************************************************************
     ** Prueba que ejecuta el servicio Popularity Tv Show Exitosamente **
     ********************************************************************/
    func testGetPopularityTvShowSuccess() {
        _expectation = expectation(description: "::: Register new user")
        
        let tokenUrl = String(
            format: RPEServiceConfig.tv_show_popular, RPELoginMock.apiToken
        )
        _tvShowService?.httpGetRest(
            url: tokenUrl,
            extraHeaders: nil,
            gnRequestType: RPEHttpRequestType.TV_SHOW_PUPULAR.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /**************************************************************
     ** Prueba que ejecuta el servicio Rate Tv Show Exitosamente **
     **************************************************************/
    func testGetRateTvShowSuccess() {
        _expectation = expectation(description: "::: Register new user")
        
        let tokenUrl = String(
            format: RPEServiceConfig.tv_show_rated, RPELoginMock.apiToken
        )
        _tvShowService?.httpGetRest(
            url: tokenUrl,
            extraHeaders: RPELoginMock.SessionHeader,
            gnRequestType: RPEHttpRequestType.TV_SHOW_RATE.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    /******************************************************************
     ** Prueba que ejecuta el servicio Upcoming Tv Show Exitosamente **
     ******************************************************************/
    func testGetUpcomingTvShowSuccess() {
        _expectation = expectation(description: "::: Register new user")
        
        let tokenUrl = String(
            format: RPEServiceConfig.tv_show_upcoming, RPELoginMock.apiToken
        )
        _tvShowService?.httpGetRest(
            url: tokenUrl,
            extraHeaders: nil,
            gnRequestType: RPEHttpRequestType.TV_SHOW_UPCOMING.rawValue)
        
        self.waitForExpectations(timeout: GNConfigService.TimeOutInterval, handler: nil)
    }
    
    func dataResponseService(response: RPETvShowResponseEntity) {
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
