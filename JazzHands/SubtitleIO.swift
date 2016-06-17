//
//  SubtitleIO.swift
//  TDD
//
//  Created by Julian Scharf on 3/06/2016.
//  Copyright © 2016 Julian Scharf. All rights reserved.
//

import Foundation
import UIKit

class SubtitleIO {
  
  func openSRTFile(filename: String) -> String {
    let path = NSBundle.mainBundle().pathForResource(filename, ofType: "srt")
    let contents: NSString
    
    do {
      contents = try NSString(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
    } catch _ {
      contents = ""
    }
    
    return String(contents)
  }
  
}

