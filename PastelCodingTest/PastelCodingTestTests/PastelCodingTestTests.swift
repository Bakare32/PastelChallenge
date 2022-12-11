//
//  PastelCodingTestTests.swift
//  PastelCodingTestTests
//
//  Created by mac on 10/12/2022.
//

import XCTest
@testable import PastelCodingTest

final class PastelCodingTestTests: XCTestCase {
    
    // MARK: - Properties
    private var newsVM: NewsViewModel!
    var newsViewTest: NewsView!

    override func setUp() {
        super.setUp()
        self.newsVM = NewsViewModel()
        self.newsViewTest = NewsView()
    }
    
    //Testing the data from the posts
    func test_For_newsList() {
        XCTAssertTrue(newsVM.newsList.count != 0)
    }
   

}
