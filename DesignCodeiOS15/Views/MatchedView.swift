//
//  MatchedView.swift
//  DesignCodeiOS15
//
//  Created by Todd James on 8/12/22.
//

import SwiftUI

struct MatchedView: View {
  
  @Namespace var namespace
  @State var show = false
  
  var body: some View {
    ZStack {
      if !show {
        VStack(alignment: .leading, spacing: 12){
          Text("SwiftUI") // Start of Animation, everything before matchedGeo should be that same a s the other one
            .font(.largeTitle.weight(.bold))
            .matchedGeometryEffect(id: "title", in: namespace)
            .frame(maxWidth: .infinity, alignment: .leading)
          
          Text("20 sections - 4 hours".uppercased())
            .font(.footnote.weight(.semibold))
            .matchedGeometryEffect(id: "subtitle", in: namespace)
          
          Text("Build an iOS app for iOS15 with custom layouts, animations and ...")
            .font(.footnote)
            .matchedGeometryEffect(id: "text", in: namespace)
        }
        .padding(20)
        .foregroundColor(.white)
        .background(
          Color.red.matchedGeometryEffect(id: "background", in: namespace)
        )
        .padding(20)
      } else {
        VStack(alignment: .leading, spacing: 12){
          Spacer()
          
          Text("Build an iOS app for iOS15 with custom layouts, animations and ...")
            .font(.footnote)
            .matchedGeometryEffect(id: "text", in: namespace)
          
          Text("20 sections - 4 hours".uppercased())
            .font(.footnote.weight(.semibold))
            .matchedGeometryEffect(id: "subtitle", in: namespace)
          
          Text("SwiftUI") // End of Animation
            .font(.largeTitle.weight(.bold))
            .matchedGeometryEffect(id: "title", in: namespace)
            .frame(maxWidth: .infinity, alignment: .leading)
          
         
        }
        .padding(20)
        .foregroundColor(.black)
        .background(
          Color.blue.matchedGeometryEffect(id: "background", in: namespace)
        )
      }
    }
    .onTapGesture {
      withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
        show.toggle()
      }
      
    }
  }
}

struct MatchedView_Previews: PreviewProvider {
  static var previews: some View {
    MatchedView()
  }
}
