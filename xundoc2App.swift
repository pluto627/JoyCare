import SwiftUI

// 修改主App结构
@main
struct xundoc2App: App {
    var body: some Scene {
        WindowGroup {
            LaunchView() // 使用LaunchView替代直接显示ContentView
        }
    }
}
