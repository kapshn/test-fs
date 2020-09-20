//
//  main.swift
//  test-fs
//
//  Created by Monday MeoW. on 20.09.2020.
//  Copyright © 2020 MMW. All rights reserved.
//

import Foundation

//print("Hello, World!")

var Cars = [Car]()

var userDefaults = UserDefaults.standard

//save
func saveData(){
    do {
        let encodedData = try! NSKeyedArchiver.archivedData(withRootObject: Cars, requiringSecureCoding: false)
        userDefaults.set(encodedData, forKey: "Cars")
        userDefaults.synchronize()
    } 
}

//Load
let decoded  = userDefaults.data(forKey: "Cars")
do {
    if let decodedTeams = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded!) as? [Car] {
        Cars = decodedTeams
    }
} catch {
    print("Couldn't read data")
}


func newCar(year : Int, manufacturer: String, model: String, type: String)  {
    let nCar = Car.init(year: year, manufacturer: manufacturer, model: model, type: type)
    Cars.append(nCar)
    main()
}
func deleteCar(id:Int)  {
    Cars.remove(at: id)
    main()
}
func updateCar(id:Int, year : Int, manufacturer: String, model: String, type: String) {
    Cars[id].setYear(newYear: year)
    Cars[id].setManufacturer(newManufacturer: manufacturer)
    Cars[id].setModel(newModel: model)
    Cars[id].setType(newType: type)
    main()
}
func showCar(id:Int){
    let year = Cars[id].getYear()
    let manufacturer = Cars[id].getManufacturer()
    let model = Cars[id].getModel()
    let type = Cars[id].getType()
    
    print(year," ",manufacturer," ",model," ",type,"\n")
    main()
}



func main()  {
    
    let count = Cars.count
    print("\n Available for viewing cars: ",count,"\n")
    var int : Int = 0
    var int1 : Int = 0
    var newYear: Int = 0
    var newManufacturer : String = ""
    var newModel : String = ""
    var newType : String = ""
    let countCars : Int = Int(Cars.count)-1
    print("1) show\n 2) delete\n 3) update\n 4) new\n 5) exit")
    
    if let str = readLine(){
        int = Int(str)!
    }
    switch  int {
    case 1:
        print("which one? from 0 to ", countCars)
        if let str = readLine(){
            int1 = Int(str)!
        }
        showCar(id: int1)
    case 2:
        print("which one? from 0 to ", countCars)
        if let str = readLine(){
            int1 = Int(str)!
        }
        deleteCar(id: int1)
    case 3:
        print("which one? from 0 to ", countCars)
        if let str = readLine(){
            int1 = Int(str)!
        }
        print("Year? Previos data:", Cars[int1].getYear())
        if let str = readLine(){
            newYear = Int(str)!
        }
        print("Manufacturer? Previos data:", Cars[int1].getManufacturer())
        newManufacturer = readLine()!
        print("Model? Previos data:", Cars[int1].getModel())
        newModel = readLine()!
        print("Type? Previos data:", Cars[int1].getType())
        newType = readLine()!
        
        updateCar(id: int1, year: newYear, manufacturer: newManufacturer, model: newModel, type: newType)
    case 4:
        
        print("Year? ")
        if let str = readLine(){
            newYear = Int(str)!
        }
        print("Manufacturer? ")
        newManufacturer = readLine()!
        print("Model? ")
        newModel = readLine()!
        print("Type? ")
        newType = readLine()!
        
        newCar(year: newYear, manufacturer: newManufacturer, model: newModel, type: newType)
        
    default: break
        
    }
    saveData()
}

main()
//let count = Cars.count
//print("Available for viewing cars: ",count,"\n")
//showCar(id: 0)
//
//for (id,_) in Cars.enumerated(){
//    showCar(id: id)
//}
//
//deleteCar(id: 1)
//print("car deleted")
//
//for (id,_) in Cars.enumerated(){
//    showCar(id: id)
//}


