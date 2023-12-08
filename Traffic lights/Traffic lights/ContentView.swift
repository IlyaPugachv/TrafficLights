import SwiftUI

enum TrafficLightState {
    case red
    case yellow
    case green
}

struct ContentView: View {
    @State private var lightState = TrafficLightState.red
    @State private var buttonText = "Next"
    
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(.red)
                .opacity(lightState == .red || lightState == .yellow ? 1 : 0.3)
                .frame(width: 100, height: 100)
                .padding()
            
            Circle()
                .foregroundColor(.yellow)
                .opacity(lightState == .yellow || lightState == .yellow ? 1 : 0.3)
                .frame(width: 100, height: 100)
                .padding()
            
            Circle()
                .foregroundColor(.green)
                .opacity(lightState == .green ? 1 : 0.3)
                .frame(width: 100, height: 100)
                .padding()
            
            Button(action: {
                self.nextLightState()
            }, label: {
                Text(buttonText)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func nextLightState() {
        switch lightState {
        case .red:
            lightState = .yellow
            buttonText = "Next"
        case .yellow:
            lightState = .green
        case .green:
            lightState = .red
            buttonText = "Start"
        }
    }
}

#Preview {
    ContentView()
}

