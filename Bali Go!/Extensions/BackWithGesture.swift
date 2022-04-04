//
//  BackWithGesture.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 04.04.2022.
//

import Foundation
import UIKit

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
