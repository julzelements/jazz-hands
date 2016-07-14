//
//  SubtitlePlayer.swift
//  JazzHands
//
//  Created by Julian Scharf on 12/07/2016.
//  Copyright © 2016 Julian Scharf. All rights reserved.
//

import Foundation

class SubtitlePlayer {
  
  var subtitleInitializedTime: NSDecimalNumber = 0
  var timer = NSTimer()
  var runLoop: NSRunLoop
  
  init(initializedTime: NSDecimalNumber) {
    runLoop = NSRunLoop.currentRunLoop()
  }
  
  func startTimer() {
    let date = NSDate().dateByAddingTimeInterval(1)
    
    print("It is now: \(NSDate().timeIntervalSinceNow)")
    timer = NSTimer(
      fireDate: date,
      interval: 0,
      target: self,
      selector: #selector(runCode),
      userInfo: nil,
      repeats: false)
    
    NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
    
    print("The time since 1970 in seconds is: \(NSTimeIntervalSince1970)")
    print("startTimer did fire")
    print("timer status is: \(timer.valid)")
  }
  
  @objc func runCode(){
    print(NSTimeIntervalSince1970)
    print("RunCode did fire")
  }
}