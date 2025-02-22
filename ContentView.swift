import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @StateObject private var reminderManager = ReminderManager()
    
    // 添加震动反馈函数
    private func tabFeedback() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Today page
            HomeView(reminderManager: reminderManager)
                .tabItem {
                    Image(systemName: "calendar")
                    Text("今日")
                }
                .tag(0)
                .onChange(of: selectedTab) { oldValue, newValue in
                    if newValue == 0 {
                        tabFeedback()
                    }
                }
            
            // Reminder page
            ReminderView(reminderManager: reminderManager)
                .tabItem {
                    Image(systemName: "bell.fill")
                    Text("提醒")
                }
                .tag(1)
                .onChange(of: selectedTab) { oldValue, newValue in
                    if newValue == 1 {
                        tabFeedback()
                    }
                }
            
            // Records page
            MedicalMainView()
                .tabItem {
                    Image(systemName: "doc.text")
                    Text("病例记录")
                }
                .tag(2)
                .onChange(of: selectedTab) { oldValue, newValue in
                    if newValue == 2 {
                        tabFeedback()
                    }
                }
            
            // Profile page
            ProfileView()  // 将 Text 替换为 ProfileView
                .tabItem {
                    Image(systemName: "person")
                    Text("我的")
                }
                .tag(3)
                .onChange(of: selectedTab) { oldValue, newValue in
                    if newValue == 3 {
                        tabFeedback()
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
