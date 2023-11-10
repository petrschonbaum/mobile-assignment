//
//  NetworkingService.swift
//  Task
//
//  Created by Petr Schönbaum on 08.10.2023.
//

import Foundation

protocol NetworkingServiceType {
    func sendRequest<T: Decodable>(endpoint: Endpoint, urlParams: [URLQueryItem]?, body: Encodable?) async throws -> T
}

final class NetworkingService: NetworkingServiceType {

    private let session: URLSession
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder

    init(
        session: URLSession = .shared,
        decoder: JSONDecoder = .init(),
        encoder: JSONEncoder = .init()
    ) {
        self.session = session
        self.decoder = decoder
        self.encoder = encoder
    }

    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        urlParams: [URLQueryItem]? = nil,
        body: Encodable? = nil
    ) async throws -> T {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = urlParams

        guard let url = urlComponents.url else {
            throw RequestError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header

        if let body = body {
            request.httpBody = try? encoder.encode(body)
        }

        do {
            let (data, response) = try await session.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                throw RequestError.noResponse
            }
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? decoder.decode(T.self, from: data) else {
                    throw RequestError.decode
                }
                return decodedResponse
            default:
                throw RequestError.unexpectedStatusCode
            }
        }
    }
}

