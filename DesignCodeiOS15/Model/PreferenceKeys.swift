//
//  PreferenceKeys.swift
//  DesignCodeiOS15
//
//  Created by Todd James on 8/10/22.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
  static var defaultValue: CGFloat = 0
  
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value = nextValue()
  }
}
