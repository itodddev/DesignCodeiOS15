//
//  Tab.swift
//  DesignCodeiOS15
//
//  Created by Todd James on 8/8/22.
//

import SwiftUI

struct TabItem: Identifiable { // for looping
  
  var id = UUID() // default value, dont have to add as param, auto-generates unique id
  var text: String
  var icon: String
  var tab: Tab
  
}

var tabItems = [
  TabItem(text: "Learn Now", icon: "house", tab: .home),
  TabItem(text: "Explore", icon: "magnifyingglass", tab: .explore),
  TabItem(text: "Notifications", icon: "bell", tab: .notifications),
  TabItem(text: "Library", icon: "rectangle.stack", tab: .library)
]

enum Tab: String {
  case home
  case explore
  case notifications
  case library
}
