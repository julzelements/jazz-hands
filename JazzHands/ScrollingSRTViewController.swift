//
//  ScrollingSRTViewController.swift
//  SRTScroller
//
//  Created by Julian Scharf on 2/06/2016.
//  Copyright © 2016 Julian Scharf. All rights reserved.
//

import UIKit

class ScrollingSRTViewController: UITableViewController {

  var subtitle: Subtitle!
  var subtitleIO: SubtitleIO!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      subtitleIO = SubtitleIO()
      let rawSubtitleStanzas = subtitleIO.openSRTFile("XMen")
      subtitle = Subtitle(subtitleText: rawSubtitleStanzas)
      
    
    }

  
  func userDidTap(){
    print("user tapped")
  }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subtitle.stanzas.count
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SRTCell", forIndexPath: indexPath)
      if subtitle.stanzas[indexPath.row].linesString == "" {
        cell.backgroundColor = UIColor.darkGrayColor()
      }
//      let label = tableView.viewWithTag(100) as! UILabel
//      print(label.text)
//      print(label.bounds.size.height)

      let gesture = UITapGestureRecognizer(target: self, action: #selector(userDidTap))
      cell.addGestureRecognizer(gesture)
        return cell
    }
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
  {
//    print("getting height for cell \(indexPath.row)")
    if let labelView = tableView.viewWithTag(100) {
      let stanza: Stanza = subtitle.stanzas[indexPath.row]
      let label = labelView as! UILabel
      
      let attributedString = formatStanza(stanza)
      label.attributedText = attributedString
      
//      print(label.text)
//      print(label.bounds.size.height)
      if let cellHeight = stanza.duration  {
        return (CGFloat(cellHeight) * 50)
      }
    }
    return 100.0
  }
  
  func formatStanza(stanza: Stanza) -> NSAttributedString {
    let htmlStr =
      "<b>Start time:</b> \(stanza.startTime)<br />" +
        stanza.linesString + "<br />" +
        "<b>Duration:</b> \(stanza.duration)<br />" +
        "<b>End time:</b> \(stanza.endTime)"
    let attributtedString = try! NSAttributedString(
      data: htmlStr.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
      options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
      documentAttributes: nil
    )
    return attributtedString
  }
 
}
