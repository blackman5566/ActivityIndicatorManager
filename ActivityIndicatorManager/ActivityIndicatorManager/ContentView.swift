//
//  ContentView.swift
//  ActivityIndicatorManager
//
//  Created by Allen_Hsu on 2025/5/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button {
                ActivityIndicatorManager.shared.start()

                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    ActivityIndicatorManager.shared.stop()
                }
            
            } label: {
                Text("Click Loading")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color(red: 95/255, green: 159/255, blue: 248/255))
                    .cornerRadius(16)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
