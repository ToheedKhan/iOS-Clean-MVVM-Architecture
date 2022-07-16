//
//  MovieListViewModelSpec.swift
//  MovieTrailersTests
//
//  Created by Toheed Jahan Khan on 16/07/22.
//

import Quick
import Nimble
@testable import MovieTrailers

class MovieListViewModelSpecs: QuickSpec {
    override func spec() {
        var movieListViewModel: MovieListViewModel?
        let movieUseCase = MockFetchMovieUseCase()
        describe("The 'Movie List View Model'") {
            context("When movie data fetched from server successfully") {
                afterEach {
                    
                }
                beforeEach {
                    movieListViewModel = MovieListViewModel(useCase: movieUseCase)
                    movieUseCase.movies = StubGenerator().stubMovies()
                    movieListViewModel?.getMovies()
                }
                it("Will set 'cellViewModels' array of MovieListViewModel to display data") {
                            waitUntil(timeout: DispatchTimeInterval.seconds(1)) { done in
                                // do some stuff that takes a while...
                                Thread.sleep(forTimeInterval: 1)
                                movieListViewModel?.successResponse = {
                                    expect(movieListViewModel?.cellViewModels.count).toEventually(equal(3))
                                                                                                  }
                                done()
                            }
                        
                    
                }
            }
        }
    }
}
