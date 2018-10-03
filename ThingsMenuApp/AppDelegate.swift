//
//  AppDelegate.swift
//  ThingsMenuApp
//
//  Created by Larry Gadea on 10/3/18.
//  Copyright © 2018 Larry Gadea. All rights reserved.
//

import Cocoa
import SwiftAutomation
import MacOSGlues

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.button?.target = self
        statusItem.button?.action = #selector(AppDelegate.itemAction(_:))
        statusItem.button?.title = "AA"
        
        
        
        do {
            let xx = try Finder().FinderWindows
            print("hi")
        } catch {
            print(error)
        }
        
        
        //let appleScript = NSAppleScript(source: "tell application \"Things3\"\n")
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
    }
    
    @IBAction func itemAction(_ sender: AnyObject) {
        
    }
}
