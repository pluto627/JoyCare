import SwiftUI

// 创建启动视图
struct LaunchView: View {
    @State private var isActive = false
    
    var body: some View {
        ZStack {
            // 添加白色背景作为基础层
            Color.white.ignoresSafeArea()
            
            Group {
                if isActive {
                    ContentView() // 切换到主视图
                } else {
                    VStack {
                        Image("Launch") // 使用名为"Launch"的图片
                            .resizable()
                            .scaledToFit()
                            .frame(width: 500, height: 500)
                        
                        Text("Xundoc")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.top, 20)
                            .foregroundColor(.black) // 固定文字颜色为黑色
                    }
                    .onAppear {
                        // 2秒后切换到主视图
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    LaunchView()
}
