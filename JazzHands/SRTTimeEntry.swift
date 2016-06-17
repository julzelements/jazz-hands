//
//  SRTTimeEntry.swift
//  TDD
//
//  Created by Julian Scharf on 9/06/2016.
//  Copyright © 2016 Julian Scharf. All rights reserved.
//

import Foundation

class SRTTimeEntry {
  
  var startTime: Double!
  var endTime: Double!
  
  
  init(inputTimeString time: String) {
    let splitTime = extractTime(time)
    startTime = parseTimeString(splitTime.start)
    endTime = parseTimeString(splitTime.end)
    
  }
  
  
  func extractTime(inputTimeString: String) -> (start: String, end: String) {
    let splitTime = inputTimeString.componentsSeparatedByString(" --> ")
    let start = splitTime[0]
    let end = splitTime[1]
    return (start, end)
  }
  
  func parseTimeString(inputString: String) -> Double {
    //Expected input format 00:00:00,000
    
    let skippedCharacters = NSMutableCharacterSet.punctuationCharacterSet()
    skippedCharacters.formUnionWithCharacterSet(NSCharacterSet.whitespaceCharacterSet())
    
    let scanner = NSScanner(string: inputString)
    scanner.charactersToBeSkipped = skippedCharacters
    
    var hours: Double = 0
    var minutes: Double = 0
    var seconds: Double = 0
    var milliseconds: Double = 0
    
    scanner.scanDouble(&hours)
    scanner.scanDouble(&minutes)
    scanner.scanDouble(&seconds)
    scanner.scanDouble(&milliseconds)
    
    let timeBlock = TimeBlock(hours: hours, minutes: minutes, seconds: seconds, milliseconds: milliseconds)
    
    return timeBlock.totalSeconds
  }
  
  struct TimeBlock {
    var hours: Double = 0
    var minutes: Double = 0
    var seconds: Double = 0
    var milliseconds: Double = 0
    var totalSeconds: Double {
      get {
        let hoursAccurate = Double(hours * 60 * 60)
        let minutesAccurate = Double(minutes * 60)
        let secondsAccurate = Double(seconds * 1)
        let millisecondsAccurate = Double(milliseconds / 1000.00)
        let totalSeconds = hoursAccurate + minutesAccurate + secondsAccurate + millisecondsAccurate
        return totalSeconds
      }
    }
  }


}


