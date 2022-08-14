//
//  HomeView.swift
//  DesignCodeiOS15
//
//  Created by Todd James on 8/9/22.
//

import SwiftUI

struct HomeView: View {
  
  @Namespace var namespace // parent namespace
  @State var show = false
  
  @State var hasScrolled = false
  
  var body: some View {
    ZStack {
      
      Color("Background")
        .ignoresSafeArea()
      
      ScrollView {
        
        scrollDetection
        
        featured
        
        Text("Courses".uppercased())
          .font(.footnote.weight(.semibold))
          .foregroundColor(.secondary)
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.horizontal, 20)

        // Color.clear.frame(height: 1000) // to get scrollbars
        
        if !show {
          CourseItem(namespace: namespace, show: $show)
            .onTapGesture {
              withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
              }
            }
        }
      }
      .coordinateSpace(name: "scroll")
      .safeAreaInset(edge: .top, content: {
        Color.clear.frame(height: 70)
      })
      .overlay(
        NavigationBar(title: "Featured", hasScrolled: $hasScrolled)
      )
      
      if show {
        CourseView(namespace: namespace, show: $show)
      }
      
    }
  }
  
  var scrollDetection: some View {
    GeometryReader { proxy in
      //Text("\(proxy.frame(in: .named("scroll")).minY)")
      Color.clear.preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scroll")).minY)
    }
    .frame(height: 0)
    .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
      withAnimation(.easeInOut) {
        if value < 0 {
          hasScrolled = true
        } else {
          hasScrolled = false
        }
      }
    })
  }
  
  var featured: some View {
    TabView {
      ForEach(courses) { course in
        GeometryReader { proxy in
          
          let minX = proxy.frame(in: .global).minX
          
          FeaturedItem(course: course)
            .padding(.vertical, 40) // by default GR uses least amout of space, so will clip items outside the card, shadows, etc
            .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
            .shadow(color: Color("Shadow").opacity(0.3), radius: 10, x: 0, y: 10)
            .blur(radius: abs(minX / 40))
            .overlay(
              Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 230)
                .offset(x: 32, y: -80)
                .offset(x: minX / 2)
            )
          
          
          // Text("\(proxy.frame(in: .global).minX)")
        }
      }
    }
    .tabViewStyle(.page(indexDisplayMode: .never))
    .frame(height: 430)
    .background(
      Image("Blob 1")
        .offset(x: 250, y: -100)
    )
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
      .previewDevice("iPhone 12 Pro Max")
  }
}
