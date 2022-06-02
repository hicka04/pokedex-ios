//
//  SwiftGenPlugin.swift
//  
//
//  Created by hicka04 on 2022/06/01.
//

import Foundation
import PackagePlugin

@main
struct SwiftGenPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let outputFilesDirectory = context.pluginWorkDirectory
        return [
            .prebuildCommand(
                displayName: "SwiftGen",
                executable: try context.tool(named: "swiftgen").path,
                arguments: [
                    "config", "run",
                    "--config",
                    target.directory.appending("swiftgen.yml").string,
                    "--verbose"
                ],
                environment: [
                    "INPUT_DIR": target.directory.appending("Resources").string,
                    "OUTPUT_DIR": outputFilesDirectory.string,
                ],
                outputFilesDirectory: outputFilesDirectory
            )
        ]
    }
}
