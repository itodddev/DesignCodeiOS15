//
//  TabBar.swift
//  DesignCodeiOS15
//
//  Created by Todd James on 8/8/22.
//

import SwiftUI

struct TabBar: View {
  
  @AppStorage("selectedTab") var selectedTab: Tab = .home
  @State var color: Color = .teal
  @State var tabItemWidth: CGFloat = 0
  
  var body: some View {
    HStack {
      buttons
    } //: HSTACK
    .padding(.horizontal, 8)
    .padding(.top, 14)
    .frame(height: 88, alignment: .top)
    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
    .background( // circle behind the material sheet
      background
    )
    .overlay( // line at top
      overlay
    )
    .strokeStyle(cornerRadius: 34)
    .frame(maxHeight: .infinity, alignment: .bottom)
    .ignoresSafeArea()
  }
  
  var buttons: some View {
    ForEach(tabItems) { item in
      Button {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
          selectedTab = item.tab // on button click set selectedTab to current tab
          color = item.color
        }
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
      .blendMode(selectedTab == item.tab ? .overlay : .normal)
      .overlay(
        GeometryReader { proxy in
          //  Text("\(proxy.size.width)")
          //  tabItemWidth = proxy.size.width
          Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
        }
      )
      .onPreferenceChange(TabPreferenceKey.self) { value in
        tabItemWidth = value
      }
    } //: FOREACH
  }
  
  var background: some View {
    HStack {
      if selectedTab == .library { Spacer() }
      if selectedTab == .explore { Spacer() }
      if selectedTab == .notifications {
        Spacer()
        Spacer()
      }
      
      Circle().fill(color).frame(width: tabItemWidth)
      
      if selectedTab == .home { Spacer() }
      if selectedTab == .explore {
        Spacer()
        Spacer()
      }
      if selectedTab == .notifications { Spacer() }
    }
    .padding(.horizontal, 8) // mimick horizontal padding on above HStack to position cicle behind tab
  }
  
  var overlay: some View {
    HStack {
      if selectedTab == .library { Spacer() }
      if selectedTab == .explore { Spacer() }
      if selectedTab == .notifications {
        Spacer()
        Spacer()
      }
      
      Rectangle()
        .fill(color)
        .frame(width: 28, height: 5)
        .cornerRadius(3)
        .frame(width: tabItemWidth) // same frame size to align with circle
        .frame(maxHeight: .infinity, alignment: .top)
      
      if selectedTab == .home { Spacer() }
      if selectedTab == .explore {
        Spacer()
        Spacer()
      }
      if selectedTab == .notifications { Spacer() }
    }
    .padding(.horizontal, 8) // mimick horizontal padding on above HStack to position cicle behind tab
  }
}

struct TabBar_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TabBar()
        .previewDevice("iPhone 12 Pro Max")
        .previewInterfaceOrientation(.portraitUpsideDown)
      TabBar()
        .preferredColorScheme(.dark)
        .previewDevice("iPhone 12 Pro Max")
    }
  }
}
