//
//  Endpoint.swift
//  Task
//
//  Created by Petr Schönbaum on 08.10.2023.
//

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
}
