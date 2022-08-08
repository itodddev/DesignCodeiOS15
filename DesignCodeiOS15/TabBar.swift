//
//  TabBar.swift
//  DesignCodeiOS15
//
//  Created by Todd James on 8/8/22.
//

import SwiftUI

struct TabBar: View {
  
  @State var selectedTab: Tab = .home
  
  var body: some View {
    ZStack(alignment: .bottom) {
      
      Group {
        switch(selectedTab) {
          case .home:
            // Contentview takes whole screen
            ContentView()
          case .explore:
            AccountView()
          case .notifications:
            EmptyView()
          case .library:
            EmptyView()
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity) // add frame to Group
      
      //HStack ontop of ContentView, but aligned to ZStack .bottom
      HStack {
        Spacer()
        
        ForEach(tabItems) { item in
          Button {
            selectedTab = item.tab // on button click set selectedTab to current tab
          } label: {
            VStack(spacing: 0) {
              Image(systemName: item.icon)
                .symbolVariant(.fill)
                .font(.body.bold())
                .frame(width: 80, height: 29)
              Text(item.text)
                .font(.caption2)
                .lineLimit(1)
            } //: VSTACK
            .frame(maxWidth: .infinity)
          } //: BUTTON
          .foregroundStyle(selectedTab == item.tab ? .primary : .secondary) // if selected tab = item.tab change color
        } //: FOREACH
      } //: HSTACK
      .padding(.horizontal, 8)        .padding(.top, 14)
      .frame(height: 88, alignment: .top)
      .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
      .strokeStyle(cornerRadius: 34)
      .frame(maxHeight: .infinity, alignment: .bottom)
      .ignoresSafeArea()
      
    }
  }
}

struct TabBar_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TabBar()
        .previewDevice("iPhone 12 Pro Max")
      TabBar()
        .preferredColorScheme(.dark)
        .previewDevice("iPhone 12 Pro Max")
    }
  }
}
