// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "ZSignApple",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_13),
    ],
    products: [
        .library(
            name: "ZSignApple",
            targets: ["ZSign", "ZSignVapor"]),
    ],
    targets: [
        // Target for SwiftUI app
        .target(
            name: "ZSign",
            dependencies: ["OpenSSL"],
            publicHeadersPath: "./Includes",
            cxxSettings: [
                .headerSearchPath("."),
            ],
            linkerSettings: [
                .linkedFramework("OpenSSL"),
            ]
        ),
        // Target for Vapor app
        .target(
            name: "ZSignVapor",
            dependencies: ["COpenSSL"],
            publicHeadersPath: "./Includes",
            cxxSettings: [
                .headerSearchPath("."),
            ]
            // Note: Linker settings for system libraries are typically not needed
        ),
        .binaryTarget(
            name: "OpenSSL",
            path: "Binaries/OpenSSL.xcframework"
        ),
        .systemLibrary(
            name: "COpenSSL",
            pkgConfig: "openssl",
            providers: [
                .brew(["openssl"]),
                .apt(["openssl libssl-dev"])
            ]
        ),
    ],
    cxxLanguageStandard: .cxx14
)
