// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ZSignApple",
    products: [
        .library(
            name: "ZSignApple",
            targets: ["ZSign"]),
    ],
    targets: [
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
        .systemLibrary(
            name: "OpenSSL",
            pkgConfig: "openssl",
            providers: [
                .apt(["openssl libssl-dev"]),
                .brew(["openssl"]),
            ]
        )
    ],
    cxxLanguageStandard: .cxx14
)
