//
//  RequestError.swift
//  Task
//
//  Created by Petr Schönbaum on 08.10.2023.
//

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unexpectedStatusCode
    case unknown
}

