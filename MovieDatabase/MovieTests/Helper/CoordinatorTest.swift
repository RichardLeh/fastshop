//
//  CoordinatorTest.swift
//  MovieTests
//
//  Created by Richard Leh on 21/04/19.
//  Copyright © 2019 Richard Leh. All rights reserved.
//

import Quick
import Nimble
@testable import Movie

class CoordinatorTest: QuickSpec {
    override func spec() {
        var sut: Coordinator!
        describe("CoordinatorTest'") {
            
            context("When it's created") {
                beforeEach {
                    sut = Coordinator()
                }
                it("should have an indicatorView with .whiteLarge style") {
                    expect(sut.rootViewController).to(beAKindOf(HomeViewController.self))
                }
            }
        }
    }
}
