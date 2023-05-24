//
//  FirestoreManager.swift
//  TiredWiredInspired
//
//  Created by Vasu Raina on 5/23/23.
//

import Foundation

import Firebase

class FirestoreManager: ObservableObject {
    func sendBetToFirebase(bet: Bet) {
        let db = Firestore.firestore()
        
        do {
            let betData = try JSONEncoder().encode(bet)
            guard let betJSON = try JSONSerialization.jsonObject(with: betData, options: []) as? [String: Any] else {
                return
            }
            
            db.collection("bets").addDocument(data: betJSON) { error in
                if let error = error {
                    print("Error sending bet to Firestore: \(error.localizedDescription)")
                } else {
                    print("Bet sent to Firestore successfully.")
                }
            }
        } catch {
            print("Error encoding bet data: \(error.localizedDescription)")
        }
    }
    
    @Published var retrievedBets: [Bet] = []
       
    func retrieveDistinctBetsFromFirestore() {
        let db = Firestore.firestore()
        
        db.collection("bets").getDocuments { [weak self] (querySnapshot, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("Error retrieving documents: \(error.localizedDescription)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No documents found.")
                return
            }
            
            var betIDs = Set<String>() // Track distinct bet IDs
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Adjust the date format as per your data
            
            let bets = documents.compactMap { queryDocumentSnapshot -> Bet? in
                let data = queryDocumentSnapshot.data()
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                    let bet = try JSONDecoder().decode(Bet.self, from: jsonData)
                    
                     let commenceTimeString = bet.commence_time 
                    
                    if let commenceTime = dateFormatter.date(from: commenceTimeString) {
                        let currentDate = Date()
                        if commenceTime > currentDate {
                            if !betIDs.contains(bet.id) {
                                betIDs.insert(bet.id)
                                return bet
                            }
                        }
                    }
                } catch {
                    print("Error decoding document: \(error.localizedDescription)")
                    return nil
                }
                
                return nil
            }
            
            DispatchQueue.main.async {
                self.retrievedBets = bets
            }
        }
    }
}
