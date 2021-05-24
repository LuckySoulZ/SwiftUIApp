//
//  LocationModel.swift
//  SwiftUIApp
//
//  Created by LuckySoul on 20/05/21.
//

import Foundation
import MapKit

struct LocationModel: Codable, Identifiable {
  // MARK: - PROPERTIES
  var id: String
  var name: String
  var image: String
  var latitude: Double
  var longitude: Double
  
  // Computed Property
  var location: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}
