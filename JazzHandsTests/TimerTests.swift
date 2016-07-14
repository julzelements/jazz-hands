//
//  TimerTests.swift
//  JazzHands
//
//  Created by Julian Scharf on 12/07/2016.
//  Copyright © 2016 Julian Scharf. All rights reserved.
//

import XCTest

@testable import JazzHands

class TimerTests: XCTestCase {
  
    
    func testShowSubtitle() {
      let subtitlePlayer = SubtitlePlayer(initializedTime: 0.0)
      
      let runUntil = NSDate(timeIntervalSinceNow: 2.0)
      
      let runLoop = NSRunLoop.currentRunLoop()
      runLoop.runUntilDate(runUntil)
      
      subtitlePlayer.startTimer()
      
    }
    
}
