//
//  MyBundleToken.swift
//  
//
//  Created by hicka04 on 2022/03/03.
//

import Foundation

final class MyBundleToken {
    private static let previewBundlePath: URL = {
        let typeName = type(of: MyBundleToken())
        // "\(ModuleName).MyBundleToken"
        let nsClassString = NSStringFromClass(typeName)
        guard let bundleName = nsClassString.components(separatedBy: ".").first else {
            fatalError("failed get bundle name: \(nsClassString)")
        }

        let searchUrl: URL = Bundle(for: MyBundleToken.self)
            .bundleURL
            .deletingLastPathComponent()
            .deletingLastPathComponent()
        let list: [URL]
        do {
            list = try FileManager.default.contentsOfDirectory(at: searchUrl, includingPropertiesForKeys: nil)
        } catch let error {
            fatalError("failed get contents: \(searchUrl)")
        }
        let firstMatch: URL? = list.first { (url: URL) in
            let name = url.lastPathComponent
            return name.contains("_\(bundleName).bundle")
        }
        guard let res = firstMatch else {
            let jointed = list.map { $0.relativeString }
                .joined(separator: "\n")
            fatalError("no url contains: _\(bundleName).bundle\n\(jointed)")
        }
        return res
    }()
    static let bundle: Bundle = {
#if SWIFT_PACKAGE
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            return Bundle(url: previewBundlePath)!
        } else {
            return Bundle.module
        }
#else
        return Bundle(for: MyBundleToken.self)
#endif
    }()
}
