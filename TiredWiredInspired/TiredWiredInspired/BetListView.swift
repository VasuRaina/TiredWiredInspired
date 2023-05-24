import SwiftUI
import Firebase

struct BetListView: View {
    var bets: [Bet]
    
    @EnvironmentObject var firestoreManager: FirestoreManager
    
    let RFC3339DateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    @State private var selectedActions: [String: Int] = [:]

    var body: some View {
            VStack(alignment: .leading) {
                ForEach(bets) { bet in
                    VStack {
                        ForEach(bet.bookmakers, id: \.title) { bookmaker in
                            VStack {
                                betInfoView(bet: bet, bookmaker: bookmaker)
                                actionsView(for: bookmaker, bet: bet) // Pass 'bet' here
                            }
                            .padding()
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(10)
                            .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
                            .padding(.horizontal)
                        }
                    }
                }
            }
        }

    func betInfoView(bet: Bet, bookmaker: Bet.Bookmaker) -> some View {
        Group {
            if let date = RFC3339DateFormatter.date(from: bet.commence_time) {
                let formattedDate = formatBetDate(date)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(bookmaker.title)
                            .foregroundColor(.white)
                        Text(formattedDate)
                            .foregroundColor(.white)
                    }.font(.callout)
                    
                    VStack(alignment: .leading) {
                        Text(bet.home_team)
                            .foregroundColor(.white)
                        Text(bet.away_team)
                            .foregroundColor(.white)
                    }.font(.callout)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        if let homeOutcome = bookmaker.markets.first?.outcomes.first(where: { $0.name == bet.home_team }) {
                            Text("\(homeOutcome.price)")
                                .foregroundColor(.white)
                        }
                        
                        if let awayOutcome = bookmaker.markets.first?.outcomes.first(where: { $0.name == bet.away_team }) {
                            Text("\(awayOutcome.price)")
                                .foregroundColor(.white)
                        }
                    }
                }
            } else {
                Text("Invalid date")
                    .foregroundColor(.white)
            }
        }
    }

    func actionsView(for bookmaker: Bet.Bookmaker, bet: Bet) -> some View  {
        HStack {
            VStack {
                Image(systemName: "bed.double")
                    .padding(.horizontal)
                    .foregroundColor(selectedAction(for: bookmaker, bet: bet) == 0 ? .green : .white)
                    .onTapGesture {
                        toggleSelectedAction(for: bookmaker, actionIndex: 0, bet: bet)
                    }
            }

            VStack {
                Image(systemName: "bolt.heart")
                    .padding(.horizontal)
                    .foregroundColor(selectedAction(for: bookmaker, bet: bet) == 1 ? .orange : .white)
                    .onTapGesture {
                        toggleSelectedAction(for: bookmaker, actionIndex: 1, bet: bet)
                    }
            }

            VStack {
                Image(systemName: "eye")
                    .padding(.horizontal)
                    .foregroundColor(selectedAction(for: bookmaker, bet: bet) == 2 ? .yellow : .white)
                    .onTapGesture {
                        toggleSelectedAction(for: bookmaker, actionIndex: 2, bet: bet)
                    }
            }
        }
    }
    
    func toggleSelectedAction(for bookmaker: Bet.Bookmaker, actionIndex: Int, bet: Bet) {
        let key = "\(bet.id)_\(bookmaker.key)"
        if selectedAction(for: bookmaker, bet: bet) == actionIndex {
            selectedActions[key] = nil
        } else {
            selectedActions[key] = actionIndex
            if actionIndex == 0 || actionIndex == 1 || actionIndex == 2 {
                firestoreManager.sendBetToFirebase(bet: bet)
            }
        }
    }
    
    func selectedAction(for bookmaker: Bet.Bookmaker, bet: Bet) -> Int? {
        let key = "\(bet.id)_\(bookmaker.key)"
        return selectedActions[key]
    }
    
    func formatBetDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: date)
    }
}

struct BetListView_Previews: PreviewProvider {
    static var previews: some View {
        let mockBets: [Bet] = [] // Provide some mock data here
        return BetListView(bets: mockBets)
    }
}
