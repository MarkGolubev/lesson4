//
//  main.swift
//  lesson4
//
//  Created by Марк Голубев on 17.03.2021.
//

import Foundation

enum SpecialSignalSate: String {
    case on = "Включены", off = "Отключены"
}

enum EngineState: String {
    case on = "Запущен", off = "Заглушен"
}

class PoliceCar {
    let brand: String
    let yearOfMade: Int
    let transmissionAuto: Bool
    let color: String
    var km: Double
    var specialSignalState: SpecialSignalSate
    var engineState: EngineState
    
    init(brand: String, yearOfMade: Int, transmissionAuto: Bool, km: Double, color: String, specialSignalState: SpecialSignalSate, engineState: EngineState) {
        self.brand = brand
        self.yearOfMade  = yearOfMade
        self.transmissionAuto = transmissionAuto
        self.km = km
        self.color = color
        self.specialSignalState = specialSignalState
        self.engineState = engineState
    }
    
    func printPropertyCar() {
        print("Настройки первой линии")
        print("___________________________________")
        print("Марка машины: \(self.brand)")
        print("Год выпуска машины: \(self.yearOfMade)")
        print("Трансмиссия автоматическая: \(self.transmissionAuto ? "Да" : "Нет")")
        print("Пробег: \(self.km)")
        print("Цвет: \(self.color)")
        print("Спец. сигналы: \(self.specialSignalState.rawValue)")
        print("Двигатель: \(self.engineState.rawValue)")
        print("___________________________________")
    }
    
    func turnOnSignal() {
    }
    
    func turnOffSignal() {
    }
    
    func turnOnEngine() {
    }
    
    func turnOffEngine() {
    }
}

class PatrolCar: PoliceCar {
    let model: ModelPatrolCar
    let speaker: Bool
    let specialFrontLight: Bool
    var speakerState: Bool
    var frontLightState: Bool
    
    init(brand: String, yearOfMade: Int, transmissionAuto: Bool, km: Double, color: String, specialSignalState: SpecialSignalSate, model: ModelPatrolCar, speaker: Bool, specialFrontLight: Bool, engineState: EngineState, frontLightState: Bool, speakerState: Bool) {
        self.model = model
        self.speaker = speaker
        self.specialFrontLight = specialFrontLight
        self.frontLightState = frontLightState
        self.speakerState = speakerState
        super.init(brand: brand, yearOfMade: yearOfMade, transmissionAuto: transmissionAuto, km: km, color: color, specialSignalState: specialSignalState, engineState: engineState)
    }
    
    enum ModelPatrolCar {
        case viper, turtle
    }
    
    enum ActionEquipment {
        case onSpeaker
        case offSpeaker
        case onFrontLight
        case offFrontLight
    }
    
    func actionEquipment(action: ActionEquipment) {
        switch action {
        case .onSpeaker:
            speakerState = true
            print("Матюгальник включен")
        case .offSpeaker:
            speakerState = false
            print("Матюгальник выключен")
        case .onFrontLight:
            frontLightState = true
            print("Патрульный фонарь включен")
        case .offFrontLight:
            frontLightState = false
            print("Патрульный фонарь выключен")
        }
    }
    
    override func printPropertyCar() {
        super.printPropertyCar()
        print("Настройки второй линии")
        print("___________________________________")
        print("Модель машины: \(self.model)")
        print("Наличие матюгальника: \(self.speaker ? "Да" : "Нет")")
        print("Наличие ручного фонаря: \(self.specialFrontLight ? "Да" : "Нет")")
        print("___________________________________")
    }
    
    override func turnOnEngine() {
        engineState = .on
        print("*Врум-врум*")

    }
    
    override func turnOffEngine() {
        engineState = .off
        print("*звук остановки двигателя*")
    }
    
    override func turnOnSignal() {
        specialSignalState = .on
        print("*мигалка мерцает синим цветом*")
    }
    
    override func turnOffSignal() {
        specialSignalState = .off
        print("*мигалка перестала мерцать*")
    }
}

class VenCar: PoliceCar {
    let model: ModelVenCar
    let cell: Bool
    var numberOfPrsoners: Int {
        didSet {
            let newValue = oldValue + numberOfPrsoners
            print("Вы загрузили \(numberOfPrsoners) заключенных, теперь их стало человек \(newValue)")
        }
        
    }
    
    var cellState: Bool

    init(brand: String, yearOfMade: Int, transmissionAuto: Bool, km: Double, color: String, specialSignalState: SpecialSignalSate, model: ModelVenCar, engineState: EngineState, cell: Bool, NumberOfPrsoners: Int, cellState: Bool) {
        self.model = model
        self.cell = cell
        self.cellState = cellState
        self.numberOfPrsoners = NumberOfPrsoners
        super.init(brand: brand, yearOfMade: yearOfMade, transmissionAuto: transmissionAuto, km: km, color: color, specialSignalState: specialSignalState, engineState: engineState)
    }
    
    enum ModelVenCar {
        case dogVen, autoZack
    }
    
    enum CellState {
        case open
        case close
    }
    
    func actionCell(action: CellState) {
        switch action {
        case .open:
            cellState = true
            print("Клетка открыта")
        default:
            cellState = false
            print("Клетка закрыта")
        }
    }
    
    func addPrisoners (prisoners: Int) {
        numberOfPrsoners = prisoners
    }
    
    override func printPropertyCar() {
        super.printPropertyCar()
        print("Настройки второй линии")
        print("___________________________________")
        print("Модель машины: \(self.model)")
        print("Наличие клетки: \(self.cell ? "Да" : "Нет")")
        print("Клетка открыта: \(self.cellState ? "Да" : "Нет")")
        print("___________________________________")
    }
    
    override func turnOnEngine() {
        engineState = .on
        print("*долго кряхтит*")
        print("*врум-врум*")
    }
    
    override func turnOffEngine() {
        engineState = .off
        print("*звук остановки двигателя*")
        print("*кабину дико трясет*")
    }
    
    override func turnOnSignal() {
        specialSignalState = .on
        print("*мигалка мерцает синим цветом*")
        print("*потухла*")
        print("*мигалка мерцает синим цветом*")
    }
    
    override func turnOffSignal() {
        specialSignalState = .off
        print("*мигалка перестала мерцать*")
    }
}

var patrolCar1 = PatrolCar(brand: "Chevrolet", yearOfMade: 2019, transmissionAuto: true, km: 0.0, color: "Черный", specialSignalState: .off, model: .viper, speaker: true, specialFrontLight: true, engineState: .off, frontLightState: false, speakerState: false)

patrolCar1.printPropertyCar()
patrolCar1.turnOnEngine()
patrolCar1.actionEquipment(action: .onFrontLight)
patrolCar1.turnOnSignal()

print("\n=============================================================================\n")

var venCar1 = VenCar(brand: "Chevrolet", yearOfMade: 2010, transmissionAuto: false, km: 0.0, color: "Синий", specialSignalState: .off, model: .autoZack, engineState: .off, cell: true, NumberOfPrsoners: 0, cellState: false)

venCar1.printPropertyCar()
venCar1.actionCell(action: .open)
venCar1.addPrisoners(prisoners: 7)
venCar1.turnOnEngine()


