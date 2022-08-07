//
//  AccountView.swift
//  DesignCodeiOS15
//
//  Created by Todd James on 8/7/22.
//

import SwiftUI

struct AccountView: View {
    
    @State var isDeleted = false
  
    var body: some View {
      NavigationView {
        List {
          VStack(spacing: 8) {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
              .font(.system(size: 32))
              .symbolRenderingMode(.palette)
              .foregroundStyle(.blue, .blue.opacity(0.3))
              .padding()
              .background(Circle().fill(.ultraThinMaterial))
              .background(
                Image(systemName: "hexagon")
                  .symbolVariant(.fill)
                  .foregroundColor(.blue)
                  .font(.system(size: 200))
                  .offset(x: -50, y: -100)
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
                
                Button {
                  
                } label: {
                  Label("Pin", systemImage: "pin")
                }
                .tint(.yellow)

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
            
          }
          .accentColor(.primary)
          .listRowSeparator(.hidden)
          
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Account")      }
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
