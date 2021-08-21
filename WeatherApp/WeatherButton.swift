//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by GD on 21.8.2021.
//

import SwiftUI


struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    
    var body: some View {
        Button(action: {
                print("Tapped")
            
        }, label: {
            Text(title)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
        })
    }
}


