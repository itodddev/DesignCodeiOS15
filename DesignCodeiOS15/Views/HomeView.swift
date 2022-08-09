//
//  HomeView.swift
//  DesignCodeiOS15
//
//  Created by Todd James on 8/9/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
      ScrollView {
        FeaturedItem()
        
        Color.clear.frame(height: 1000) // to get scrollbars
  
      }
      .safeAreaInset(edge: .top, content: {
        Color.clear.frame(height: 70)
      })
      .overlay(
        NavigationBar(title: "Featured")
      )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
