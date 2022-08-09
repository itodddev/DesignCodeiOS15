//
//  ContentView.swift
//  DesignCodeiOS15
//
//  Created by Todd James on 8/6/22.
//

import SwiftUI

struct ContentView: View {
  
  @AppStorage("selectedTab") var selectedTab: Tab = .home
  
  var body: some View {
    ZStack(alignment: .bottom) {
      
      switch(selectedTab) {
        case .home:
          // Contentview takes whole screen
          HomeView()
        case .explore:
          AccountView()
        case .notifications:
          EmptyView()
        case .library:
          EmptyView()
      }
      
      TabBar()
    }
    .safeAreaInset(edge: .bottom) {
      Color.clear.frame(height: 44)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
        .preferredColorScheme(.dark)
        .previewDevice("iPhone 12 Pro Max")
      ContentView()
        .previewDevice("iPhone 12 Pro Max")
    }
  }
}
