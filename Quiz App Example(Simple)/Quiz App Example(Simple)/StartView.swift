import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to the Quiz App")
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: ContentView()) {
                    Text("Start Quiz")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Quiz App")
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
