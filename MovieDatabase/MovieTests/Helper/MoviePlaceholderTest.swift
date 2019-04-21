//
//  MoviePlaceholderTest.swift
//  MovieTests
//
//  Created by Richard Leh on 21/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Quick
import Nimble
@testable import Movie

class MoviePlaceholderTest: QuickSpec {
    override func spec() {
        var sut: MoviePlaceholder!
        describe("MoviePlaceholderTest'") {
            
            context("When it's created") {
                beforeEach {
                    sut = MoviePlaceholder()
                }
                it("should have an indicatorView with .whiteLarge style") {
                    expect(sut.indicatorView.style).to(equal(.whiteLarge))
                }
                it("indicatorView should not be animating") {
                    expect(sut.indicatorView.isAnimating).to(beFalse())
                }
            }
            context("When it's created and a ImageView is added") {
                beforeEach {
                    sut = MoviePlaceholder()
                    sut.add(to: UIImageView())
                }
                it("indicatorView should be animating") {
                    expect(sut.indicatorView.isAnimating).to(beTrue())
                }
            }
        }
    }
}
