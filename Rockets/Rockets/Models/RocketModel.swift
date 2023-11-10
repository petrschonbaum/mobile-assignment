//
//  RocketModel.swift
//  Rockets
//
//  Created by Petr Schönbaum on 05.11.2023.
//

struct RocketModel: Decodable, Identifiable, Equatable {

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case firstFlight = "first_flight"
        case description
        case height
        case diameter
        case mass
        case firstStage = "first_stage"
        case secondStage = "second_stage"
        case images = "flickr_images"
    }

    let id: String
    let name: String
    let firstFlight: String
    let description: String
    let height: Height
    let diameter: Diameter
    let mass: Mass
    let firstStage: Stage
    let secondStage: Stage
    let images: [String]
}


struct Height: Decodable, Equatable {
    enum CodingKeys: String, CodingKey {
        case value = "meters"
    }

    let value: Double
}

struct Diameter: Decodable, Equatable {
    enum CodingKeys: String, CodingKey {
        case value = "meters"
    }

    let value: Double
}

struct Mass: Decodable, Equatable {

    enum CodingKeys: String, CodingKey {
        case value = "kg"
    }

    let value: Double
}

struct Stage: Decodable, Equatable {

    enum CodingKeys: String, CodingKey {
        case reusable
        case engines
        case fuelAmount = "fuel_amount_tons"
        case burnTime = "burn_time_sec"
    }

    let reusable: Bool
    let engines: Int
    let fuelAmount: Double
    let burnTime: Int?
}

