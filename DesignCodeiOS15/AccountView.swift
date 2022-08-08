//
//  AccountView.swift
//  DesignCodeiOS15
//
//  Created by Todd James on 8/7/22.
//

import SwiftUI

struct AccountView: View {
  
  @State var isDeleted = false
  @State var isPinned = false

  var body: some View {
    NavigationView {
      List {
        profile
        
        menu
        
        links
      }
      .listStyle(.insetGrouped)
      .navigationTitle("Account")
      
    }
  }
  
  var profile: some View {
    VStack(spacing: 8) {
      Image(systemName: "person.crop.circle.fill.badge.checkmark")
        .font(.system(size: 32))
        .symbolRenderingMode(.palette)
        .foregroundStyle(.blue, .blue.opacity(0.3))
        .padding()
        .background(Circle().fill(.ultraThinMaterial))
        .background(
          HexagonView()
            .offset(x: -50, y: -100)
        )
        .background(
          BlobView()
            .offset(x: 200, y: 0)
            .scaleEffect(0.6)
        )
      Text("Todd James")
        .font(.title.weight(.semibold))
      HStack {
        Image(systemName: "location")
          .imageScale(.small)
        Text("United States")
          .foregroundColor(.secondary)
      }
    }
    .frame(maxWidth: .infinity)
    .padding()
  }
  
  var menu: some View {
    Section {
      NavigationLink(destination: ContentView()) {
        Label("Settings", systemImage: "gear")
      }
      
      NavigationLink {
        Text("Billing")
      } label: {
        Label("Billing", systemImage: "creditcard")
      }
      
      NavigationLink { ContentView() } label: {
        Label("Help", systemImage: "questionmark")
      }
      
    }
    .accentColor(.primary)
    .listRowSeparatorTint(.blue)
    .listRowSeparator(.hidden)
  }
  
  var links: some View {
    Section {
      if !isDeleted {
        Link(destination: URL(string: "https://apple.com")!) {
          HStack {
            Label("Apple", systemImage: "house")
            Spacer()
            Image(systemName: "link")
              .foregroundColor(.secondary)
          }
        }
        .swipeActions(edge: .leading, allowsFullSwipe: true) {
          Button {
            isDeleted = true
          } label: {
            Label("Delete", systemImage: "trash")
          }
          .tint(.red)
          
          pinButton
        }
      }
      
      Link(destination: URL(string: "https://designcode.io")!) {
        HStack {
          Label("DesignCode.io", systemImage: "tv")
          Spacer()
          Image(systemName: "link")
            .foregroundColor(.secondary)
        }
      }
      .swipeActions(edge: .leading, allowsFullSwipe: false) {
        pinButton
      }
      
    }
    .accentColor(.primary)
    .listRowSeparator(.hidden)
  }
  
  var pinButton: some View {
    Button {
      isPinned.toggle()
    } label: {
      if isPinned {
        Label("Unpin", systemImage: "pin.slash")
      } else {
        Label("Pin", systemImage: "pin")
      }
    }
    .tint(isPinned ? .gray : .yellow)
  }
  
}



struct AccountView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AccountView()
      AccountView()
        .preferredColorScheme(.dark)
    }
  }
}
