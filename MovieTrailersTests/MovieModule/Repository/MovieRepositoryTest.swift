//
//  MovieRepositoryTest.swift
//  MovieTrailersTests
//
//  Created by Toheed Jahan Khan on 15/07/22.
//

import XCTest

@testable import MovieTrailers

class MovieRepositoryTest: XCTestCase {
    
    struct ErrorMessage {
        static let kFailedErrorMeesage = "Repository Failed Error"
    }
    
    var movieRepository: MovieRepository!
    let mockService = MockService()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        movieRepository = MovieRepository(service: mockService)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        movieRepository = nil
    }
    
    func testRepository_Success() {
        let promise = expectation(description: "Movie Repository on success")
        
        mockService.movies = StubGenerator().stubMovies()
        
        movieRepository.makeServiceCallToGetMovies()
            .done { model in
                let moviesCount = model.movies.count
                if moviesCount >= 1 {
                    promise.fulfill()
                }
            }
            .catch { _ in
                promise.fulfill()
            }
        
        wait(for: [promise], timeout: 2.0)
    }
    
    func testRepository_Failure() {
        let promise = expectation(description: "Movie Repository on Failed")
        
        mockService.error = NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.kFailedErrorMeesage])
        
        movieRepository.makeServiceCallToGetMovies()
            .catch {error in
                XCTAssertTrue(error.localizedDescription == ErrorMessage.kFailedErrorMeesage)
                promise.fulfill()
            }
        
        wait(for: [promise], timeout: 2.0)
    }
    
}
