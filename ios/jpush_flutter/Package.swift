// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "jpush_flutter",
  platforms: [
    .iOS("12.0")
  ],
  products: [
    .library(name: "jpush-flutter", targets: ["jpush_flutter"])
  ],
  dependencies: [
    // Flutter 框架由工具链在构建时注入（路径相对于 .packages 软链布局）。
    .package(name: "FlutterFramework", path: "../FlutterFramework"),
    // 极光官方 SDK 的 SwiftPM 包（与 CocoaPods 版本保持一致）。
    .package(url: "https://github.com/jpush/jpush-sdk.git", from: "6.1.0"),
    .package(url: "https://github.com/jpush/jcore-sdk.git", from: "5.4.2"),
  ],
  targets: [
    .target(
      name: "jpush_flutter",
      dependencies: [
        .product(name: "FlutterFramework", package: "FlutterFramework"),
        .product(name: "JPush", package: "jpush-sdk"),
        .product(name: "JCore", package: "jcore-sdk"),
      ],
      cSettings: [
        .headerSearchPath("include/jpush_flutter")
      ]
    )
  ]
)
