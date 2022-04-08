//
//  PokemonDataStoreTests.swift
//  
//
//  Created by hicka04 on 2022/04/02.
//

import XCTest
@testable import Infra
import OHHTTPStubsSwift
import OHHTTPStubs

@MainActor
class PokemonDataStoreTests: XCTestCase {
    var dataStore: PokemonDataStore!
    let pokemonName = "bulbasaur"

    @MainActor
    override func setUp() async throws {
        dataStore = .init()
    }

    override func tearDown() async throws {
        HTTPStubs.removeAllStubs()
    }
}

// MARK: - getPokemon
extension PokemonDataStoreTests {
    func test_getPokemon_whenNetworkError_shouldThrowError() async {
        stub(condition: isPath("/api/v2/pokemon/\(pokemonName)")) { request in
            HTTPStubsResponse(error: NSError(domain: "hoge", code: -1))
        }

        await XCTAssertThrowsError(try await dataStore.getPokemon(name: pokemonName))
    }

    func test_getPokemon_whenReceiveErrorStatusCode_shouldThrowError() async {
        stub(condition: isPath("/api/v2/pokemon/\(pokemonName)")) { request in
            HTTPStubsResponse(data: .init(), statusCode: .random(in: 400 ..< 600), headers: nil)
        }

        await XCTAssertThrowsError(try await dataStore.getPokemon(name: pokemonName))
    }

    func test_getPokemon_whenReceiveInvalidJson_shouldThrowError() async {
        stub(condition: isPath("/api/v2/pokemon/\(pokemonName)")) { request in
            HTTPStubsResponse(jsonObject: ["hoge": "fuga"], statusCode: 200, headers: nil)
        }

        await XCTAssertThrowsError(try await dataStore.getPokemon(name: pokemonName))
    }

    func test_getPokemon_whenReceiveValidJson_shouldReturnPokemonList() async throws {
        stub(condition: isPath("/api/v2/pokemon/\(pokemonName)")) { request in
            HTTPStubsResponse(
                fileAtPath: OHPathForFileInBundle("bulbasaur.json", .module)!,
                statusCode: 200,
                headers: nil
            )
        }

        let result = try await dataStore.getPokemon(name: pokemonName)
        XCTAssertEqual(result.id, .init(rawValue: 1))
    }
}

extension XCTest {
    func XCTAssertThrowsError<T: Sendable>(
        _ expression: @autoclosure () async throws -> T,
        _ message: @autoclosure () -> String = "",
        file: StaticString = #filePath,
        line: UInt = #line,
        _ errorHandler: (_ error: Error) -> Void = { _ in }
    ) async {
        do {
            _ = try await expression()
            XCTFail(message(), file: file, line: line)
        } catch {
            errorHandler(error)
        }
    }
}
