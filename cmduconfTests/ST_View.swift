//
//  ST_View.swift
//  cmduconf
//
//  Created by Luis Ascorbe Martínez on 06/07/16.
//  Copyright © 2016 @lascorbe. All rights reserved.
//

import UIKit
import Quick
import Nimble
import Cartography
@testable import cmduconf

class ST_View: QuickSpec {
    
    // Note: Return 'true' to regenerate the snapshots of this class
    override var recordingMode: Bool {
        return false
    }
    
    let delegate = ViewController()
    
    override func spec() {
        describe("A View") {
            context("on a 4' screen") {
                let view = View(delegate: self.delegate)
                constrain(view) { view in
                    view.width == 320
                    view.height == 568
                }
                it("has a valid snapshot") {
                    expect(view).to(self.validateSnapshot())
                }
            }
            context("on a 5.5' screen") {
                let view = View(delegate: self.delegate)
                constrain(view) { view in
                    view.width == 414
                    view.height == 736
                }
                it("has a valid snapshot") {
                    expect(view).to(self.validateSnapshot())
                }
            }
        }
    }
}
