//
//  AccountView.swift
//  DesignCodeiOS15
//
//  Created by Todd James on 8/7/22.
//

import SwiftUI

struct AccountView: View {
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
            Label("Settings", systemImage: "gear")
            Label("Billing", systemImage: "creditcard")
            Label("Help", systemImage: "questionmark")
          }
          .listRowSeparatorTint(.blue)
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
