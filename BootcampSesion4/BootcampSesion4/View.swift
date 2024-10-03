//
//  ContentView.swift
//  BootcampSesion4
//
//  Created by José Valderrama on 03/10/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.blue
                    .ignoresSafeArea()
            
            VStack {
                HStack {
                    Spacer()
                    Text("9:12 AM")
                    Spacer()
                    Image(systemName: "magnifyingglass")
                }
                
                Spacer()
                
                Text(viewModel.response?.location.name ?? "Loading")
                    .font(.largeTitle)
                Text("Tuesday, 12 Apr 2022")
                
                Spacer()
            
                AsyncImage(url: .init(string: viewModel.response?.current.condition.fullIconPath ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                } placeholder: {
                    ProgressView()
                }
                
                Text("82.4°F")
                    .font(.system(size: 80))
                
                Text("It’s a sunny day.")
                    .padding(.bottom)
                
                HStack {
                    Image(systemName: "wind")
                    Text("3 mph")
                        .padding(.trailing)
                    
                    Image(systemName: "humidity")
                    Text("60%")
                }
                
                Spacer()
                
                HStack {
                    VStack {
                        Image(systemName: "sun.max.fill")
                        Text("82.4°/86°F")
                            .font(.caption2)
                        Text("Today")
                            .bold()
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "sun.rain.fill")
                        Text("62.6°/71.6°F")
                            .font(.caption2)
                        Text("Tomorrow")
                            .bold()
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "cloud.snow.fill")
                        Text("61.5°/72°F")
                            .font(.caption2)
                        Text("Friday")
                            .bold()
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
        }
        .onAppear {
            Task { 
                await viewModel.loadData()
            }
        }
    }
}

#Preview {
    ContentView()
}
