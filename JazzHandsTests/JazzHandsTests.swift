//
//  JazzHandsTests.swift
//  JazzHandsTests
//
//  Created by Julian Scharf on 17/06/2016.
//  Copyright © 2016 Julian Scharf. All rights reserved.
//

import XCTest
@testable import JazzHands

class JazzHandsTests: XCTestCase {
  
  func testOpenTestSRT() {
    let subtitleIO = SubtitleIO()
    let testText = "test Text 1\r\ntest Text 2\r\n\r\ntest Text 3\r\n"
    let testSubtitle = subtitleIO.openSRTFile("Test")
    
    XCTAssert(testText == testSubtitle)
    
  }
  
  func testOpenSRT() {
    let subtitleIO = SubtitleIO()
    let xMenSubtitle = "1\r\n00:00:00,000 --> 00:00:05,000\r\n<font color=\"#FFFF00\">SP3Subteam</font>\r\n<font color=#00FFFF>https://www.facebook.com/SP3Subteam</font>\r\n\r\n2\r\n00:00:09,890 --> 00:00:11,910\r\nI saw the end of the world.\r\n\r\n3\r\n00:00:13,280 --> 00:00:16,710\r\nI could feel all this death.\r\n\r\n4\r\n00:00:16,810 --> 00:00:19,480\r\nJean,\r\nit was just a dream.\r\n\r\n5\r\n00:00:29,020 --> 00:00:31,720\r\n<font color=\"#969696\">En Sabah Nur:</font>\r\n<i>I\'ve been called many things over many lifetimes:</i>\r\n\r\n6\r\n00:00:34,040 --> 00:00:37,360\r\n<i>Ra, Krishna, Yahweh.</i>\r\n\r\n7\r\n00:00:38,040 --> 00:00:40,110\r\n<font color=\"#969696\">Moira MacTaggert:</font>\r\n<i>Ever since the world found out about mutants...</i>\r\n\r\n8\r\n00:00:40,280 --> 00:00:42,180\r\n<i>There have been secret societies...</i>\r\n\r\n9\r\n00:00:42,180 --> 00:00:45,910\r\n<i>who see them as some kind of second coming or sign of god. </i>\r\n\r\n10\r\n00:00:46,370 --> 00:00:48,850\r\n<i>They believe that tens of thousands of years ago,</i>\r\n\r\n"
    let testSubtitle = subtitleIO.openSRTFile("XMen")
    XCTAssert(xMenSubtitle == testSubtitle)
    
    
    
    let split = xMenSubtitle.componentsSeparatedByString("\n\r")
    
    for (index, value) in split.enumerate() {
      if value == "" {
        print("there is nothing at index \(index)")
      }
    }
  }
  
  func testInitializeStanza() {
    let initialText = "5\r\n00:00:29,020 --> 00:00:31,720\r\n<font color=\"#969696\">En Sabah Nur:</font>\r\n<i>I\'ve been called many things over many lifetimes:</i>"
    let testIndex: Int = 5
    let testStartTime: Double = 29.020
    let testEndTime: Double = 31.72
    let testDuration: Double = testEndTime - testStartTime
    var testLines = [String]()
    testLines.append("<font color=\"#969696\">En Sabah Nur:</font>")
    testLines.append("<i>I\'ve been called many things over many lifetimes:</i>")
    let testLineString = "<font color=\"#969696\">En Sabah Nur:</font>\n<i>I\'ve been called many things over many lifetimes:</i>"
    
    
    
    
    let testStanza = Stanza(inputTextOfStanza: initialText)
    XCTAssert(testStanza.stanzaIndex == testIndex)
    XCTAssert(testStanza.startTime == testStartTime)
    XCTAssert(testStanza.endTime == testEndTime)
    XCTAssert(testStanza.duration == testDuration)
    XCTAssert(testStanza.linesArray == testLines)
    XCTAssert(testStanza.linesString == testLineString)
    
  }
  
  func testTimeBlock() {
    var timeBlock = SRTTimeEntry.TimeBlock()
    timeBlock.hours = 2
    timeBlock.minutes = 3
    timeBlock.seconds = 4
    timeBlock.milliseconds = 395
    
    let accurateSeconds: Double = 7384.395
    XCTAssert(accurateSeconds == timeBlock.totalSeconds)
  }
  
  func testParseTimeString() {
    let testClass = SRTTimeEntry(inputTimeString: "00:00:29,020 --> 00:00:31,720")
    
    let inputString = "04:04:04:004"
    let testBlock = SRTTimeEntry.TimeBlock(hours: 4, minutes: 4, seconds: 4, milliseconds: 4)
    let expectedOutput = testBlock.totalSeconds
    
    let testOutput = testClass.parseTimeString(inputString)
    
    print("expectedOutput = \(expectedOutput)\n testOutput = \(testOutput)")
    
    XCTAssert(testOutput == expectedOutput)
  }
  
  func testExtractTime() {
    let inputString = "00:00:29,020 --> 00:00:31,720"
    let expectedStart = "00:00:29,020"
    let expectedEnd = "00:00:31,720"
    
    let testClass = SRTTimeEntry(inputTimeString: inputString)
    let output = testClass.extractTime(inputString)
    
    XCTAssert(expectedEnd == output.end)
    XCTAssert(expectedStart == output.start)
    
  }
  
  func testSubtitle() {
    let subtitleIO = SubtitleIO()
    let subtitleString = subtitleIO.openSRTFile("XMen")
    let subtitle = Subtitle(subtitleText: subtitleString)
    let stanzas = subtitle.stanzas
    print (stanzas.count)
  }
  
}
