//
//  Stanza.swift
//  TDD
//
//  Created by Julian Scharf on 3/06/2016.
//  Copyright © 2016 Julian Scharf. All rights reserved.
//


/* Sample raw input for stanza (As String)
 5
 00:00:29,020 --> 00:00:31,720
 <font color="#969696">En Sabah Nur:</font>
 <i>I've been called many things over many lifetimes:</i>
 */

import Foundation

class Stanza {
  
  internal var stanzaIndex: Int!
  var startTime: Double!
  var endTime: Double!
  var duration: Double!
  var linesArray: [String]!
  var linesString: String!
  
  init(inputTextOfStanza text: String) {
    
    let splitText = text.componentsSeparatedByString("\r\n")
    stanzaIndex = Int(splitText[0])
    
    if splitText.count >= 2 {
      
      let time = SRTTimeEntry(inputTimeString: splitText[1])
      startTime = time.startTime
      endTime = time.endTime
      duration = endTime - startTime
    }
    
    linesArray = getLinesArray(splitStanzaText: splitText)
    linesString = linesArray.joinWithSeparator("\n")
  }
  
  init() {
    startTime = 0
    endTime = 0
    duration = 0
    linesArray = [""]
    linesString = ""
  }
  
  func getLinesArray(splitStanzaText textArray: [String]) -> [String] {
    var index = 2
    var linesArray = [String]()
    
    guard textArray.count >= 2
      else {
        return [""]
    }
    while index < textArray.count {
      linesArray.append(textArray[index])
      index = index + 1
    }
    return linesArray
  }
  
}