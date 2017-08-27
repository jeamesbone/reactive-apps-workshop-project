//
//  ReactiveAppsWorkshopTests.swift
//  ReactiveAppsWorkshopTests
//
//  Created by Jeames Bone on 26/8/17.
//  Copyright © 2017 Jeames Bone. All rights reserved.
//

import XCTest
import ReactiveSwift
import Result

class MapTests: XCTestCase {
    let countingProducer = SignalProducer<Int, NoError>([1, 2, 3])

    func testCountingProducer() {
        var output: [Int] = []

        countingProducer.startWithValues { output += [$0] }
        XCTAssert(output == [1, 2, 3])
    }

    func testMultiplyByTwo() {
        var output: [Int] = []

        let producer = countingProducer.map { $0 * 2 }

        producer.startWithValues { output += [$0] }
        XCTAssert(output == [2, 4, 6])
    }

    func testMultiplyByThree() {
        var output: [Int] = []

//        let producer = countingProducer

//        producer.startWithValues { output += [$0] }
        XCTAssert(output == [2, 4, 6])
    }

    func testConvertToString() {
        var output: [String] = []

//        let producer = countingProducer

//        producer.startWithValues { output += [$0] }
        XCTAssert(output == ["1", "2", "3"])
    }

    func testDoubledString() {
        var output: [String] = []

//        let producer = countingProducer

//        producer.startWithValues { output += [$0] }
        XCTAssert(output == ["2", "6", "9"])
    }

    func testAllTheThings() {
        var output: [String] = []

//        let producer = countingProducer

//        producer.startWithValues { output += [$0] }
        XCTAssert(output == ["3", "", "9"])
    }
}


