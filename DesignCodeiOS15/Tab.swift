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
  
}

var tabItems = [
  TabItem(text: "Learn Now", icon: "house"),
  TabItem(text: "Explore", icon: "magnifyingglass"),
  TabItem(text: "Notifications", icon: "bell"),
  TabItem(text: "Library", icon: "rectangle.stack")
]
