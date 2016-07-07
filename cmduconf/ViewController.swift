//
//  ViewController.swift
//  cmduconf
//
//  Created by Luis Ascorbe Martínez on 06/07/16.
//  Copyright © 2016 @lascorbe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func loadView() {
        self.title = "CMD+U"
        self.view = View(delegate: self)
    }
}

extension ViewController: ViewDelegate {
    func viewButtonPressed(fromView: View) {
        print("Objc devs buy their clothes at .h & .m")
    }
}
