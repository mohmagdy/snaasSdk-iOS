//
//  NetworkTest.swift
//  Tapglue
//
//  Created by John Nilsen on 7/6/16.
//  Copyright © 2016 Tapglue. All rights reserved.
//

import XCTest
import Mockingjay
import Nimble
@testable import Tapglue

class NetworkTest: XCTestCase {

    let sampleUser = ["user_name":"user1","id_string":"someId213","password":"1234", "session_token":"someToken"]
    var sampleUserFeed = [String: AnyObject]()
    let network = Network()
    
    override func setUp() {
        super.setUp()
        sampleUserFeed["users"] = [sampleUser]
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testLogin() {
        stub(http(.POST, uri: "/0.4/users/login"), builder: json(sampleUser))
        
        var networkUser = User()
        _ = network.loginUser("user2", password: "1234").subscribeNext { user in
            networkUser = user
        }
        
        expect(networkUser.username).toEventually(equal("user1"))
    }
    
    func testLoginSetsSessionTokenToRouter() {
        stub(http(.POST, uri: "/0.4/users/login"), builder: json(sampleUser))
        
        _ = network.loginUser("user2", password: "1234").subscribe()
        
        expect(Router.sessionToken).toEventually(equal("someToken"))
    }
    
    func testRefreshCurrentUser() {
        stub(http(.GET, uri: "/0.4/me"), builder: json(sampleUser))
        
        var networkUser = User()
        _ = network.refreshCurrentUser().subscribeNext({ user in
            networkUser = user
        })
        
        expect(networkUser.username).toEventually(equal("user1"))
    }

    func testRetrieveFollowersReturnsEmptyArrayWhenNone() {
        sampleUserFeed["users"] = [User]()
        stub(http(.GET, uri: "/0.4/me/followers"), builder: json(sampleUserFeed))
        var followers: [User]?
        _ = network.retrieveFollowers().subscribeNext { users in
            followers = users
        }

        expect(followers).toNotEventually(beNil())
    }
    
    func testRetrieveFollowers() {
        stub(http(.GET, uri: "/0.4/me/followers"), builder: json(sampleUserFeed))
        var followers = [User]()
        _ = network.retrieveFollowers().subscribeNext { users in
            followers = users
        }
        expect(followers).toNotEventually(contain(sampleUser))
    }
}
