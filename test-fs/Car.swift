//
//  Car.swift
//  focus-start
//
//  Created by Monday MeoW. on 20.09.2020.
//  Copyright © 2020 MMW. All rights reserved.
//

import Foundation

class Car: NSObject, NSCoding{
    func encode(with coder: NSCoder) {
        coder.encode(year, forKey: "year")
        coder.encode(manufacturer, forKey: "manufacturer")
        coder.encode(model, forKey: "model")
        coder.encode(type, forKey: "type")
    }
    
    required convenience init?(coder: NSCoder) {
        let year = coder.decodeInteger(forKey: "year")
        let manufacturer = coder.decodeObject(forKey: "manufacturer") as! String
        let model = coder.decodeObject(forKey: "model") as! String
        let type = coder.decodeObject(forKey: "type") as! String
        self.init(year: year, manufacturer: manufacturer, model: model, type: type)
    }

    
    
    private var year : Int
    private var manufacturer : String
    private var model : String
    private var type : String
    
    init(year: Int, manufacturer: String, model: String, type: String) {
        self.year = year
        self.manufacturer = manufacturer
        self.model = model
        self.type = type
    }
    
    func setYear(newYear: Int) {
        year = newYear
    }
    func setManufacturer(newManufacturer: String) {
        manufacturer = newManufacturer
    }
    func setModel(newModel: String) {
        model = newModel
    }
    func setType(newType: String) {
        type = newType
    }
    func getYear() -> Int {
        return year
    }
    func getManufacturer() -> String {
        return manufacturer
    }
    func getModel() -> String {
        return model
    }
    func getType() -> String {
        return type
    }
   
}
