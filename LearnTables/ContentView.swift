import SwiftUI

struct ContentView: View {
    @State private var firstNumber = Int.random(in: 2...12)
    @State private var numbers: [Int] = Array(2...12).shuffled()
    @State private var secondNumber: Int = 0 // Initialize with a default value
    
    @State private var showAlert = false
    @State private var alertTitle = "Hi"
    @State private var alertContent = "testing"
    
    @State private var rotation = 0.0
    
    @State private var score = 0
    
    private var answer: Int {
        return firstNumber * secondNumber
    }

    struct GameButton: View {
        var text: String
        var action: (Int) -> Void

        var body: some View {
            Button(action: {
                if let value = Int(text) {
                    action(value)
                }
            }) {
                Text(text)
                    .frame(width: 90, height: 50)
                    .background(Color.indigo)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }

    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .pink, .blue, .cyan, .green, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Text("\(firstNumber) x ? = \(answer)")
                    .font(.title)
                    .foregroundStyle(.yellow)
                    .fontDesign(.rounded)
                    .fontWeight(.black)
                    .rotation3DEffect(
                        .degrees(rotation), axis: (x: 1.0, y: 0.0, z: 0.0)
                    )
                Spacer()

                VStack {
                    GameButton(text: "\(numbers[0])", action: action)
                    GameButton(text: "\(numbers[1])", action: action)
                    GameButton(text: "\(numbers[2])", action: action)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 30)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))

                Spacer()
                Spacer()
                Text("Your Score: \(score)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .fontDesign(.rounded)
                    .foregroundStyle(Color.blue)
                    .animation(.bouncy, value: score)
                Spacer()
                Spacer()
            }
        }
        .onAppear {
            // Initialize secondNumber with a random element from numbers array
            secondNumber = numbers[Int.random(in: 0...2)]
        }
        .alert(alertTitle, isPresented: $showAlert) {
            Button("Ok") {}
        } message: {
            Text("\(alertContent)")
        }
    }

    func action(value: Int) {
        // Update secondNumber when a button is tapped
        
        if value == secondNumber {
            alertTitle = "Correct ✅"
            alertContent = "Your answer is correct!"
            withAnimation {
                score += 1
            }
        } else {
            alertTitle = "Wrong 🥲"
            alertContent = "Your answer is wrong, the correct answer is \(secondNumber)"
        }
        
        withAnimation {
            rotation += 360
            showAlert = true
            numbers.shuffle()
            firstNumber = Int.random(in: 2...12)
            secondNumber = numbers[Int.random(in: 0...2)]
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
