//
//  MapView.swift
//  SurfProject
//
//  Created by Bertrand MARIE on 30/08/2024.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct MapView: View {
    @State private var cameraPosition: MapCameraPosition = .region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 46.915052, longitude: -2.041419),
        span: MKCoordinateSpan(latitudeDelta: 2.1, longitudeDelta: 0.9)
    ))
    @State var isShowingSpotInfos = false //save pin action on tap
    @State var selectedSpot: SurfSpot? //optional type -> can do a [SurfSpot] type
    
    var Surf_Spot = SurfSpotIViewList()
    var PinModel = PinModelView(risk: "")
    
    var body: some View {
        
        Map(position: $cameraPosition) {
            ForEach(Surf_Spot.SurfSpotArr, id: \.id) { SurfSpot in
                Annotation(SurfSpot.name, coordinate: CLLocationCoordinate2D(latitude: SurfSpot.latitude, longitude: SurfSpot.longitude)) {
                    Button(action: {
                        isShowingSpotInfos.toggle() //on-off effect sheet
                        selectedSpot = SurfSpot //simple spot selector
                    }) {
                        PinModelView(risk: SurfSpot.risk)
                    } //end of button action
                } //end of Annotation
            } //end of loop
        } //end of map
        
        .sheet(isPresented: $isShowingSpotInfos) {
            if let spot = selectedSpot {
                VStack { //sheet view info of spot
                    Text(spot.name).font(.title).fontWeight(.bold)
                    Text("Latitude: \(spot.latitude)")
                    Text("Longitude: \(spot.longitude)")
                    HStack {
                        Text("Status:")
                        Text(spot.risk)
                            .foregroundColor(PinModel.colorBackPin())
                            .   fontWeight(.bold)
                    }
                } //end of sheet view info of spot
                .presentationDetents([.medium, .large])
                .presentationBackground(.thinMaterial)
            } else {
                Text("No Spot Selected")
                    .presentationDetents([.medium, .large])
                    .presentationBackground(.thinMaterial)
            } //end of spot condition
        } //end of sheet isShowingSpotInfos
        
        ZStack {
            Rectangle()
                .frame(width: 1000, height: 80)
                .foregroundColor(.blue)
                .padding(-6)
            HStack {
                Circle()
                    .frame(width: 43, height: 43)
                    .foregroundColor(.white)
                    .overlay {
                        Image(systemName: "surfboard.fill")
                            .imageScale(.large)
                            .foregroundColor(.blue)
                    }
                Text("SpiderSurf Open !")
                    .foregroundColor(.white)
            }
        }
    } //end body
} //end struct

#Preview {
    MapView()
}
