//
//  ContentView.swift
//  WeatherApp
//
//  Created by GD on 20.8.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack( spacing: 10 ){
                
               CityTextView(cityName: "Helsinki, FI")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill": "cloud.sun.fill", temperature: 76)
               
                
                    HStack (spacing: 20){
                        WeatherDayView(dayOfweek: "Tue", imageName: "cloud.sun.fill", temperature: 76)
                        WeatherDayView(dayOfweek: "WED", imageName: "sun.max.fill", temperature: 88)
                        WeatherDayView(dayOfweek: "THU", imageName: "wind.snow", temperature: 55)
                        WeatherDayView(dayOfweek: "FRI", imageName: "sunset.fill", temperature: 60)
                        WeatherDayView(dayOfweek: "SAT", imageName: "snow", temperature: 25)
                    }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
               
                
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

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightblue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        
        VStack {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        } .padding(.bottom, 40)
    }
}


