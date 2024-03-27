// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "DanmakuKit",
  platforms: [.iOS(.v15), .tvOS(.v14), .macOS(.v12)],
  products: [
    .library(name: "DanmakuKit", targets: ["DanmakuKit"]),
  ],
  targets: [
    .target(
      name: "DanmakuKit",
      dependencies: []
    ),
    .testTarget(
      name: "DanmakuKitTests",
      dependencies: ["DanmakuKit"]
    ),
  ]
)
