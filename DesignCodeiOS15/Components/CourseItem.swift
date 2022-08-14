//
//  CourseItem.swift
//  DesignCodeiOS15
//
//  Created by Todd James on 8/14/22.
//

import SwiftUI

struct CourseItem: View {
  
  var namespace: Namespace.ID
  @Binding var show: Bool
  
  var body: some View {
      VStack {
        Spacer()
        VStack(alignment: .leading, spacing: 12) {
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
        .background(
          Rectangle()
            .fill(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .blur(radius: 30)
            .matchedGeometryEffect(id: "blur", in: namespace)
        )
      }
      .foregroundColor(.white)
      .background(
        Image("Illustration 9")
          .resizable()
          .scaledToFit()
          .matchedGeometryEffect(id: "image", in: namespace)
      )
      .background(
        Image("Background 5")
          .resizable()
          .scaledToFill()
          .matchedGeometryEffect(id: "background", in: namespace)
      )
      .mask(
        RoundedRectangle(cornerRadius: 30, style: .continuous)
          .matchedGeometryEffect(id: "mask", in: namespace)
      )
      .frame(height: 300) // for spacer to not take full height
      .padding(20)
    }
}

struct CourseItem_Previews: PreviewProvider {
  
    @Namespace static var namespace
  
    static var previews: some View {
      CourseItem(namespace: namespace, show: .constant(true))
    }
}
