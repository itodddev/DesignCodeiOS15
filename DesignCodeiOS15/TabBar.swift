//
//  TabBar.swift
//  DesignCodeiOS15
//
//  Created by Todd James on 8/8/22.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
      ZStack(alignment: .bottom) {
        // Contentview takes whole screen
        ContentView()
          .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        //HStack ontop of ContentView, but aligned to ZStack .bottom
        HStack {
          Spacer()
          
          ForEach(tabItems) { item in
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
      TabBar()
        .previewDevice("iPhone 12 Pro Max")
    }
}
