import SwiftUI
import Firebase

struct FeedView: View {
    @State private var bets: [Bet] = []
    
    var body: some View {
        VStack {
            FeedViewTopBar()
            Divider()
            
            Button(action: {
                retrieveDistinctBetsFromFirestore()
            }) {
                Text("Search")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(width: 200, height: 50)
                    .background(Color(hex: "#fe395e"))
                    .cornerRadius(10)
            }
            ScrollView {
                VStack {
                    BetListView(bets: bets)
                }
            }
            
            Spacer()
            UniversalTabBar()
        }
        .ignoresSafeArea()
        .background(Color.black) // Set the background color to black
    }
    
    func retrieveDistinctBetsFromFirestore() {
        // Perform Firestore retrieval here
        let db = Firestore.firestore()
        
        db.collection("bets").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error retrieving documents: \(error.localizedDescription)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No documents found.")
                return
            }
            
            // Process the retrieved documents and update the bets array
            let bets = documents.compactMap { queryDocumentSnapshot -> Bet? in
                // Convert the Firestore document data to your Bet model
                // and return the Bet object
                
                // Example code:
                let data = queryDocumentSnapshot.data()
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                    let bet = try JSONDecoder().decode(Bet.self, from: jsonData)
                    return bet
                } catch {
                    print("Error decoding document: \(error.localizedDescription)")
                    return nil
                }
            }
            
            DispatchQueue.main.async {
                self.bets = bets
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
