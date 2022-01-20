//
//  Window.swift
//  Fiks
//
//  Created by vojta on 19.01.2022.
//

import Foundation
import AppKit

let app = NSApplication.shared

class AppDelegate: NSObject, NSApplicationDelegate {
    let window = NSWindow(contentRect: NSMakeRect(200, 200, 1300, 1300),
                          styleMask: [.titled, .closable],
                          backing: .buffered,
                          defer: false,
                          screen: nil)

    func applicationDidFinishLaunching(_ notification: Notification) {
        window.makeKeyAndOrderFront(nil)
        let field = NSTextView(frame: window.contentView!.bounds)
        field.backgroundColor = .white
        field.isContinuousSpellCheckingEnabled = true
        window.contentView?.addSubview(field)
        let view = View(frame: window.contentView!.bounds)
        window.contentView?.addSubview(view)
        DispatchQueue(label: "background").async {
            while let str = readLine(strippingNewline: false) {
                DispatchQueue.main.async {
                    field.textStorage?.append(NSAttributedString(string: str))
                }
            }
            app.terminate(self)
        }
    }
}

func launch() {
    let delegate = AppDelegate()
    app.delegate = delegate
    app.run()
}

