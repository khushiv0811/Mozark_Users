//
//  User_TestCase.swift
//  Mozark_UsersTests
//
//  Created by khushboo patel on 15/03/21.
//  Copyright © 2021 khushboo patel. All rights reserved.
//

import XCTest
import UIKit
@testable import Mozark_Users

class User_TestCase: XCTestCase
{
    var viewControllerUnderTest: User_ViewController!
       
       override func setUp() {
           super.setUp()
           
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "User_ViewController") as? User_ViewController
           
           // in view controller, menuItems = ["one", "two", "three"]
           self.viewControllerUnderTest.loadView()
           self.viewControllerUnderTest.viewDidLoad()
       }
    

    override func tearDown() {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
            super.tearDown()
        }
        
        func testHasATableView() {
            XCTAssertNotNil(viewControllerUnderTest.Table_Users)
        }
        
        func testTableViewHasDelegate() {
            XCTAssertNotNil(viewControllerUnderTest.Table_Users.delegate)
        }
        
        func testTableViewConfromsToTableViewDelegateProtocol() {
            XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDelegate.self))
            XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:didSelectRowAt:))))
        }
        
        func testTableViewHasDataSource() {
            XCTAssertNotNil(viewControllerUnderTest.Table_Users.dataSource)
        }
        
        func testTableViewConformsToTableViewDataSourceProtocol() {
            XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDataSource.self))
           
            XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:numberOfRowsInSection:))))
            XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:cellForRowAt:))))
        }

        func testTableViewCellHasReuseIdentifier()
        {
            let cell = viewControllerUnderTest.tableView(viewControllerUnderTest.Table_Users, cellForRowAt: IndexPath(row: 0, section: 0)) as? user_TVC
            let actualReuseIdentifer = cell?.reuseIdentifier
            let expectedReuseIdentifier = "user_TVC"
            XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
        }

       
    

    

}
