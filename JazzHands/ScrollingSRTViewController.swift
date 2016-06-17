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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source



    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subtitle.stanzas.count
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SRTCell", forIndexPath: indexPath)
      if subtitle.stanzas[indexPath.row].linesString == "" {
        cell.backgroundColor = UIColor.blackColor()
      }
//      let label = tableView.viewWithTag(100) as! UILabel
//      print(label.text)
//      print(label.bounds.size.height)

        return cell
    }
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
  {
    print("getting height for cell \(indexPath.row)")
    if let labelView = tableView.viewWithTag(100) {
      let label = labelView as! UILabel
      let stanza: Stanza = subtitle.stanzas[indexPath.row]
      
      
      label.text = "Start time: \(stanza.startTime)\n" + stanza.linesString + "\nDuration is \(stanza.duration)" + "\n End time: \(stanza.endTime)"
      print(label.text)
      print(label.bounds.size.height)
      if let cellHeight = stanza.duration  {
        return (CGFloat(cellHeight) * 50)
      }
    }
    return 100.0
  }
 
}
