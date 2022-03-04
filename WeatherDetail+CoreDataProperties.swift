//
//  WeatherDetail+CoreDataProperties.swift
//  WeatherApp
//
//  Created by M_AMBIN05376 on 28/02/22.
//
//

import Foundation
import CoreData


extension WeatherDetail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherDetail> {
        return NSFetchRequest<WeatherDetail>(entityName: "WeatherDetail")
    }

    @NSManaged public var temperature: Double
    @NSManaged public var feelslike: Double
    @NSManaged public var humidity: Double

}

extension WeatherDetail : Identifiable {

}
