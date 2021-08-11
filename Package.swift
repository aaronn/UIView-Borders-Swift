// swift-tools-version:5.3

import PackageDescription

let name = "UIViewBordersSwift"

let package = Package(
    name: name,
    platforms: [.iOS(.v10)],
    products: [
        .library(name: name, targets: [name]),
        .library(name: "\(name)-Dynamic", type: .dynamic, targets: [name])
    ],
    targets: [
        .target(name: name, path: name, exclude: ["Info.plist"])
    ]
)
