//
//  SnapshotEngine.swift
//  cmduconf
//
//  Created by Luis Ascorbe Martínez on 06/07/16.
//  Copyright © 2016 @lascorbe. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Nimble_Snapshots

protocol SnapshotEngine {
    var recordingMode: Bool { get }
}

extension QuickSpec: SnapshotEngine {
    
    func validateSnapshot() -> MatcherFunc<Snapshotable> {
        return (recordingMode ? recordSnapshot() : haveValidSnapshot())
    }
    
    var recordingMode: Bool {
        return false
    }
}
