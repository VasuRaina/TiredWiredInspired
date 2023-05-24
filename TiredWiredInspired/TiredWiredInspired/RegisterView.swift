import SwiftUI
import Firebase

struct RegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var userIsLoggedIn: Bool = false
    
    var body: some View {
        if userIsLoggedIn{
            NewsView()
        }else {
            content
        }
        
    }
    
    var content: some View{
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.red, .pink]),
                        startPoint: .bottomTrailing,
                        endPoint: .topLeading
                    )
                    
                )
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(35))
            
            VStack {
                Text("Sign In")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                    .foregroundColor(.white)
                
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .padding(.bottom, 10)
                
                
                Button(action: {
                    
                    register { result in
                        switch result {
                        case .success(let authResult):
                            // Registration successful
                            print("Registration successful")
                        // Handle further actions, such as navigating to a new view
                        
                        case .failure(let error):
                            // Handle registration error
                            print("Registration failed: \(error.localizedDescription)")
                        // Show an alert or display an error message to the user
                        }
                    }
                }) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
            .frame(width: 350)
            .onAppear {
                Auth.auth().addStateDidChangeListener { _, user in
                    if user != nil {
                        userIsLoggedIn.toggle()
                    }
                }
            }
        }
    }
    func register(completion: @escaping (Result<AuthDataResult, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                // Handle registration error
                completion(.failure(error))
            } else if let authResult = authResult {
                // Registration successful
                completion(.success(authResult))
            } else {
                // Unexpected case
                let error = NSError(domain: "Registration Error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unexpected error occurred during registration."])
                completion(.failure(error))
            }
        }
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
