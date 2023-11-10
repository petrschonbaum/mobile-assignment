//
//  ListEndpoint.swift
//  Rockets
//
//  Created by Petr Schönbaum on 05.11.2023.
//

struct ListEndpoint: Endpoint {
    var scheme: String {
        "https"
    }

    var host: String {
        "api.spacexdata.com"
    }

    var path: String {
        "/v4/rockets"
    }

    var method: RequestMethod {
        .get
    }

    var header: [String : String]? {
        [
            "Content-Type": "application/json;charset=utf-8"
        ]
    }
}
