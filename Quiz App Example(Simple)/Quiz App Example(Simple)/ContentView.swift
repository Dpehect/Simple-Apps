import SwiftUI

struct ContentView: View {
    @State private var currentQuestionIndex = 0
    @State private var selectedAnswer: String?
    @State private var showCorrectAnimation = false
    @State private var showIncorrectAnimation = false
    @State private var showCompletionView = false

    let questions: [Question] = [
        Question(text: "What is the capital of Turkey?", answers: ["Istanbul", "Madrid", "Ankara", "Rome"], correctAnswer: "Ankara"),
        Question(text: "Which club is bigger in Turkish Super League?", answers: ["Adanaspor", "Besiktas", "Fenerbahce", "Galatasaray"], correctAnswer: "Galatasaray"),
        Question(text: "Which programming language used for this app?", answers: ["Flutter", "Swift", "Kotlin", "C#"], correctAnswer: "Swift"),
    ]

    var body: some View {
        VStack {
            if showCompletionView {
                CompletionView(restartAction: restartQuiz, finishAction: finishQuiz)
            } else {
                Text(questions[currentQuestionIndex].text)
                    .font(.largeTitle)
                    .padding()

                ForEach(questions[currentQuestionIndex].answers, id: \.self) { answer in
                    Button(action: {
                        self.selectedAnswer = answer
                        if answer == self.questions[self.currentQuestionIndex].correctAnswer {
                            self.showCorrectAnimation = true
                            self.showIncorrectAnimation = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
                                self.showCorrectAnimation = false
                                self.nextQuestion()
                            }
                        } else {
                            self.showIncorrectAnimation = true
                            self.showCorrectAnimation = false
                        }
                    }) {
                        Text(answer)
                            .padding()
                            .background(self.selectedAnswer == answer ? Color.blue : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(2)
                }

                if showCorrectAnimation {
                    Text("Correct!")
                        .font(.headline)
                        .foregroundColor(.green)
                        .transition(.scale)
                }

                if showIncorrectAnimation {
                    Text("Incorrect!")
                        .font(.headline)
                        .foregroundColor(.red)
                        .transition(.scale)
                }
            }
        }
        .padding()
        .animation(.easeInOut, value: showCorrectAnimation)
        .animation(.easeInOut, value: showIncorrectAnimation)
        .animation(.easeInOut, value: showCompletionView)
        .navigationTitle("Quiz App")
    }

    func nextQuestion() {
        if currentQuestionIndex + 1 < questions.count {
            currentQuestionIndex += 1
        } else {
            showCompletionView = true
        }
        selectedAnswer = nil
    }

    func restartQuiz() {
        currentQuestionIndex = 0
        selectedAnswer = nil
        showCompletionView = false
        showCorrectAnimation = false
        showIncorrectAnimation = false
    }

    func finishQuiz() {
        showCompletionView = false
    }
}

struct CompletionView: View {
    var restartAction: () -> Void
    var finishAction: () -> Void

    var body: some View {
        VStack {
            Text("Quiz Completed!")
                .font(.largeTitle)
                .padding()

            Button(action: {
                self.restartAction()
            }) {
                Text("Restart Quiz")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            NavigationLink(destination: StartView()) {
                Text("Finish")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
