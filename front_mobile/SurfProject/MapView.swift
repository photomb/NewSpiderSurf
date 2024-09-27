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
    @State var selectedSpot: SupaModel? //SurfSpot? //optional type -> can do a [SurfSpot] type
    
    @State var Surf_Spot = DataViewSupabaseModel() //in place of SurfSpotIViewList()
    var PinModel = PinModelView(risk: "")
    //var ListofSpots = ListingView()
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                Map(position: $cameraPosition) {
                    ForEach(Surf_Spot.viewSupaModel.supaModels, id: \.id) { Surf in
                        Annotation(Surf.name, coordinate: CLLocationCoordinate2D(latitude: Surf.latitude, longitude: Surf.longitude)) {
                            Button(action: {
                                isShowingSpotInfos.toggle() //on-off effect sheet
                                selectedSpot = Surf //simple spot selector
                            }) {
                                PinModelView(risk: Surf.risk)
                            } //end of button action
                        } //end of Annotation
                    } //end of loop
                } //end of map
                .task {
                    await Surf_Spot.viewSupaModel.fetchSupaModels()
                }
                .edgesIgnoringSafeArea(.all) //map stay on all screen
                
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
                        .frame(height: 80)
                        .foregroundColor(.beige)
                    HStack {
                        HStack {
                            Button(action: {
                            }) {
                                NavigationLink(destination: ContentView()) {
                                    RoundedRectangle(cornerRadius: 20)
                                        .shadow(color: .black, radius: 1, y: 2)
                                        .frame(width: 170, height: 43)
                                        .foregroundColor(.cyan)
                                        .padding(.leading)
                                        .overlay {
                                            HStack {
                                                Image(systemName: "arrow.left.circle.fill")
                                                    .imageScale(.large)
                                                    .foregroundColor(.beige)
                                                Text("Back to Menu")
                                                    .foregroundColor(.beige)
                                            }
                                        }
                                }
                            }
                        }
                        Spacer()
                        HStack {
                            Button(action: {
                            }) {
                                NavigationLink(destination: ListingView()) {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 170, height: 43)
                                        .shadow(color: .black, radius: 1, y: 2)
                                        .foregroundStyle(.cyan)
                                        .padding(.horizontal)
                                        .overlay {
                                            HStack {
                                                Text("Spots List")
                                                    .padding(.leading)
                                                    .foregroundColor(.beige)
                                                Image(systemName: "arrow.right.circle.fill")
                                                    .imageScale(.large)
                                                    .foregroundColor(.beige)
                                            }
                                        }
                                } // end NavLink
                            } //end Button
                        } //end HStack
                    } //end HStack
                } //end ZStack
            } //end ZStack
        } //end NavView
        .navigationBarBackButtonHidden(true)
    } //end body
} //end struct

#Preview {
    MapView()
}
