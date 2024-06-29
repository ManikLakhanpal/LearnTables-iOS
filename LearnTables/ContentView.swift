import SwiftUI

struct ContentView: View {
    @State private var firstNumber = Int.random(in: 2...12)
    @State private var secondNumber = Int.random(in: 2...12)

    private var answer: Int {
        return firstNumber * secondNumber
    }

    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .pink, .blue, .cyan, .green, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Text("\(firstNumber) x ? = \(answer)")
                    .font(.title)
                    .foregroundStyle(.yellow)
                    .fontDesign(.rounded)
                    .fontWeight(.black)
                
                VStack {
                    Button("1") {}
                        .wid
                    Button("2") {}
                    Button("3") {}
                }
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
