//
//  File.swift
//  
//
//  Created by hicka04 on 2022/06/02.
//

import Foundation
import PackagePlugin

@main
struct SourceryPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let outputFilesDirectory = context.pluginWorkDirectory
        return [
            .prebuildCommand(
                displayName: "Sourcery",
                executable: try context.tool(named: "sourcery").path,
                arguments: [
                    "--config", target.directory.appending(".sourcery.yml").string
                ],
                environment: [
                    "OUTPUT_DIR": outputFilesDirectory.string
                ],
                outputFilesDirectory: outputFilesDirectory
            )
        ]
    }
}
