

import SwiftUI
import Firebase
import FirebaseFirestore

struct ContentView: View {
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    var body: some View {
        NavigationView{
        ZStack {
            Color.black
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.pink, .red]),
                        startPoint: .bottomTrailing,
                        endPoint: .topLeading
                    )
                )
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(35))
                .offset(y: -50)
            
            Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 275, height: 275)
                            .blendMode(.lighten)
                            .offset(y: -45)
            
            VStack(spacing: 20) {
                            Spacer()
                            
                            Text("The Best Place For Comparing Live Odds")
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .offset(y: -50)
                            
                NavigationLink(destination: RegisterView()){
                                Text("Let's GOOOO")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                    .frame(width: 200, height: 50)
                                    .background(Color.red)
                                    .cornerRadius(10)
                            }
                
                        }
                        .frame(width: 350)
                        .padding(.bottom, 50)
            
        }
        .ignoresSafeArea()
    }
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
        }
    }
}


