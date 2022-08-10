//
//  HomeView.swift
//  DesignCodeiOS15
//
//  Created by Todd James on 8/9/22.
//

import SwiftUI

struct HomeView: View {
  
  @State var hasScrolled = false
  
  var body: some View {
      ScrollView {
        
        GeometryReader { proxy in
          //Text("\(proxy.frame(in: .named("scroll")).minY)")
          Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
        }
        .frame(height: 0)
        
        FeaturedItem()
        
        Color.clear.frame(height: 1000) // to get scrollbars
  
      }
      .coordinateSpace(name: "scroll")
      .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
        withAnimation(.easeInOut) {
          if value < 0 {
            hasScrolled = true
          } else {
            hasScrolled = false
          }
        }
      })
      .safeAreaInset(edge: .top, content: {
        Color.clear.frame(height: 70)
      })
      .overlay(
        NavigationBar(title: "Featured", hasScrolled: $hasScrolled)
          
      )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
      HomeView()
        .previewDevice("iPhone 12 Pro Max")
    }
}