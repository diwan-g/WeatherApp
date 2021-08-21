//
//  ContentView.swift
//  WeatherApp
//
//  Created by GD on 20.8.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, Color("lightblue")]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack( spacing: 10 ){
                Text("Helsinki, FI")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    Text("76°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                } .padding(.bottom, 40)
               
                
                    HStack (spacing: 20){
                        WeatherDayView(dayOfweek: "Tue", imageName: "cloud.sun.fill", temperature: 76)
                        WeatherDayView(dayOfweek: "WED", imageName: "sun.max.fill", temperature: 88)
                        WeatherDayView(dayOfweek: "THU", imageName: "wind.snow", temperature: 55)
                        WeatherDayView(dayOfweek: "FRI", imageName: "sunset.fill", temperature: 60)
                        WeatherDayView(dayOfweek: "SAT", imageName: "snow", temperature: 25)
                    }
                Spacer()
                
                Button(action: {
                        print("Tapped")
                    
                }, label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                })
                Spacer()
                
                }
                
                
            }
    }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfweek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfweek)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 23, weight: .bold))
            
        }
    }
}
