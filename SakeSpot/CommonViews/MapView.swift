//
//  MapView.swift
//  SakeSpot
//
//  Created by ReetDhillon on 2025-06-20.
//

import Foundation
import SwiftUI
import MapKit

struct MapView<Label: View>: View {
    
    let address: String
    let mapLink: URL
    let locationCoordinates: CLLocationCoordinate2D?
    let label: () -> Label
    
    var body: some View {
        Button{
            openAddressInMaps()
        } label: {
            label()
                .foregroundColor(.blue)
                .underline()
        }
    }
    private func openAddressInMaps() {
        if let coordinate = locationCoordinates {
            let placemark = MKPlacemark(coordinate: coordinate)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = address
            mapItem.openInMaps(launchOptions: [
                MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
            ])
        } else {
            UIApplication.shared.open(mapLink, options: [:], completionHandler: nil)
        }
    }
}
