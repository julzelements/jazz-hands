//
//  Subtitle.swift
//  TDD
//
//  Created by Julian Scharf on 7/06/2016.
//  Copyright © 2016 Julian Scharf. All rights reserved.
//

import Foundation

class Subtitle {
  var stanzas: [Stanza]
  private var splitText: [String]
  
  init (subtitleText text: String) {
    splitText = text.componentsSeparatedByString("\r\n\r\n")
    stanzas = [Stanza]()
    for text in splitText {
      let stanza = Stanza(inputTextOfStanza: text)
      stanzas.append(stanza)
    }
    stanzas = padStanzas(stanzas)
    for stanza in stanzas {
      print ("Stanza line is: \(stanza.linesString) \nwith duration of \(stanza.duration)\n")
    }
  }
  

  func padStanzas(unpaddedStanzas: [Stanza]) -> [Stanza]{
    var stanzas = unpaddedStanzas
    
    for index in 0...(stanzas.count - 2) {
      let blankStanza = Stanza()
      let blankStartTime = stanzas[index].endTime
      let blankEndTime = stanzas[index + 1].startTime
      var blankDuration = Double()
      
      if blankEndTime - blankStartTime > 0 {
        blankDuration = blankEndTime - blankStartTime
      blankStanza.linesString = ""
      blankStanza.startTime = blankStartTime
      blankStanza.endTime = blankEndTime
      blankStanza.duration = blankDuration
      
      stanzas.insert(blankStanza, atIndex: index + 1)
      }
      

    }
    return stanzas
  }
}