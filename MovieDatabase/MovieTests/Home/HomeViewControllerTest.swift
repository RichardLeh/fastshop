//
//  HomeViewControllerTest.swift
//  MovieTests
//
//  Created by Richard Leh on 21/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Quick
import Nimble
@testable import Movie

class HomeViewControllerTest: QuickSpec {
    override func spec() {
        var sut: HomeViewController!
        var serviceMock: MovieServiceMock!
        describe("HomeViewControllerTest'") {
            
            context("When it's created") {
                beforeEach {
                    serviceMock = MovieServiceMock()
                    sut = HomeViewController(service: serviceMock)
                    
                    UIApplication.shared.keyWindow!.rootViewController = sut

                }
                it("should be seeted mainView as HomeView") {
                    expect(sut.mainView).to(beAKindOf(HomeView.self))
                }
                it("should call fetchPopularMovies from service") {
                    expect(serviceMock.fetchPopularMoviesHasBeenCalled).to(beTrue())
                }
                it("should call fetchTopRatedMovies from service") {
                    expect(serviceMock.fetchTopRatedMoviesHasBeenCalled).to(beTrue())
                }
                it("shouldn't call fetchGenres from service") {
                    expect(serviceMock.fetchGenresHasBeenCalled).to(beFalse())
                }
            }
        }
    }

}
