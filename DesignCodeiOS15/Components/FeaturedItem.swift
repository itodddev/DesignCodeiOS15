//
//  FeaturedItem.swift
//  DesignCodeiOS15
//
//  Created by Todd James on 8/9/22.
//

import SwiftUI

struct FeaturedItem: View {
  
  var course: Course = courses[0]
  
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
          Spacer()
          Image(course.logo)
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fit)
            .frame(width: 26.0, height: 26.0)
            .cornerRadius(10.0)
            .padding(9)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
            .strokeStyle(cornerRadius: 16.0)
          Text(course.title)
            .font(.largeTitle)
            .fontWeight(.bold)
            .lineLimit(1)
            .foregroundStyle(.linearGradient(colors: [.primary, .primary.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
          Text(course.subtitle.uppercased())
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundStyle(.secondary)
          Text(course.text)
            .font(.footnote)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.secondary)
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20)
        .frame(height: 350.0)
        //.background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .background(.ultraThinMaterial)
        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))  // clips shadow
// has to go after 3D Rotation effect
//        .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
        .strokeStyle()
        .padding(.horizontal, 20)
// Moved to HomeView - background removed from card and is now on frame of FeaturedItem
//        .background(
//          Image("Blob 1")
//            .offset(x: 250, y: -100)
//        )
        
    }
}

struct FeaturedItem_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItem(course: courses[0])
    }
}
