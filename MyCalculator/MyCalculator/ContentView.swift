import SwiftUI

struct ContentView: View {
    @State private var firstNumber: String = ""
    @State private var secondNumber: String = ""
    @State private var operation: String = ""
    @State private var result: String = ""
    
    var body: some View {
        VStack {
            Text("Hesap Makinesi")
                .font(.largeTitle)
                .padding()
            
            TextField("Birinci sayı", text: $firstNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()
            
            TextField("İkinci sayı", text: $secondNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
                .padding()
            
            HStack {
                Button(action: {
                    calculate(operation: "+")
                }) {
                    Text("+")
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                
                Button(action: {
                    calculate(operation: "-")
                }) {
                    Text("-")
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                
                Button(action: {
                    calculate(operation: "*")
                }) {
                    Text("*")
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                
                Button(action: {
                    calculate(operation: "/")
                }) {
                    Text("/")
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
            }
            .padding()
            
            Text("Sonuç: \(result)")
                .font(.title)
                .padding()
        }
        .padding()
    }
    
    private func calculate(operation: String) {
        guard let firstValue = Double(firstNumber), let secondValue = Double(secondNumber) else {
            result = "Geçersiz sayı"
            return
        }
        
        switch operation {
        case "+":
            result = String(firstValue + secondValue)
        case "-":
            result = String(firstValue - secondValue)
        case "*":
            result = String(firstValue * secondValue)
        case "/":
            if secondValue != 0 {
                result = String(firstValue / secondValue)
            } else {
                result = "Bölen 0 olamaz"
            }
        default:
            result = "Geçersiz işlem"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
