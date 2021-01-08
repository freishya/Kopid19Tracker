//
//  ContentView.swift
//  Kopid19Tracker
//
//  Created by Izzan Oktiadi on 24/11/20.
// Github reference : https://github.com/azamsharp/COVID19SwiftUI
// Medium reference : https://medium.com/@azamsharp/building-a-covid19-tracking-app-using-swiftui-and-mvvm-design-pattern-337520fd143

import SwiftUI

struct ContentView: View {
    @ObservedObject private var trackingListVM = TrackingListViewModel()
    
    init() {
        self.trackingListVM.getTrackingData()
    }
    
    var body: some View {
        NavigationView {
            List(self.trackingListVM.trackings, id:\.fid) { tracking in
                VStack(alignment: .trailing) {
                    HStack {
                        Text(tracking.province)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .font(.custom("", size: 18))
                        Spacer()
                        
                        Text("\(tracking.positive)")
                            .foregroundColor(.red)
                            .font(.custom("", size: 40))
                    }
                    
                    HStack(alignment: .center){
                        HStack{
                            Text("☠️")
                            Text("\(tracking.death)")
                        }.padding(5)
                            .foregroundColor(Color.black)
                            .background(Color.white)
                            .cornerRadius(10)
                        
                        HStack{
                            Text("💪🏻")
                            Text("\(tracking.recovered)")
                        }.padding(5)
                            .foregroundColor(Color.black)
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    
                }
            }.navigationBarTitle("KOPID 19 Tracking")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
