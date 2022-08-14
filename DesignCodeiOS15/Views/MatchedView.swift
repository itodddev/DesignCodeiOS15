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
      } else {
        ScrollView {
          VStack{
            Spacer()
          }
          .frame(maxWidth: .infinity) // prevents from going skinny
          .frame(height: 500) // give some height, scrollview makes component take minimum height
          
          .foregroundColor(.black)
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
          .overlay( // needs to be after mask to prevent clipping, overlay can go outside of the mask
            VStack(alignment: .leading, spacing: 12) {
              Text("SwiftUI") // End of Animation
                .font(.largeTitle.weight(.bold))
                .matchedGeometryEffect(id: "title", in: namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
              
              Text("Build an iOS app for iOS15 with custom layouts, animations and ...")
                .font(.footnote)
                .matchedGeometryEffect(id: "text", in: namespace)
              
              Text("20 sections - 4 hours".uppercased())
                .font(.footnote.weight(.semibold))
                .matchedGeometryEffect(id: "subtitle", in: namespace)
              
              

              Divider()
              
              HStack {
                Image("Avatar Default")
                  .resizable()
                  .frame(width: 26, height: 26)
                  .cornerRadius(10)
                  .padding(8)
                  .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                  .strokeStyle(cornerRadius: 18)
                
                Text("Taught by Meng To")
                  .font(.footnote)
              }
            }
              .padding(20)
              .background(
                Rectangle()
                  .fill(.ultraThinMaterial)
                  .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                  .matchedGeometryEffect(id: "blur", in: namespace)
              )
              .offset(y: 250)
              .padding(20)
            
          )
        }
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
