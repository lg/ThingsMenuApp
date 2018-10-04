//
//  AppDelegate.swift
//  ThingsMenuApp
//
//  Created by Larry Gadea on 10/3/18.
//  Copyright © 2018 Larry Gadea. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet var menu: NSMenu!
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.menu = menu
        updateToDoCount()
        
        Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { (_) in
            self.updateToDoCount()
        }
    }
    
    func updateToDoCount() {
        let things = Things3()
        if things.isRunning {
            do {
                let inboxCount = try things.lists["Inbox"].toDos.count() as Int32
                let todayCount = try things.lists["Today"].toDos.count() as Int32
                statusItem.button?.title = String(inboxCount + todayCount)
                return
            } catch {
            }
        }
        statusItem.button?.title = "--"
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
    }
    
    @IBAction func openThings(_ sender: AnyObject) {
        do {
            try Things3().activate()
        } catch {
            print(error)
        }
    }
    
    @IBAction func quit(_ sender: AnyObject) {
        NSApplication.shared.terminate(self)
    }
}
