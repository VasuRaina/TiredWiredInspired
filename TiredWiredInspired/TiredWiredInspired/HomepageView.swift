

import SwiftUI

struct HomepageView: View {
    @State private var isDropdown1Expanded = false
    @State private var selectedOption1 = ""
    
    let options1 = ["NFL", "NBA", "MLB", "NHL", "MLS","MMA", "CFB", "IPL", "Test Cricket"]
    @State private var bets: [Bet] = []
    
        var body: some View {
            let headerView = VStack(spacing: 0) {
                Color(hex: "#fa3c60")
                    .frame(height: 125)
                    
                
                Image("logobanner")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(height: 60)
                    .offset(y: -80)
            }
            
            let chooseSportView = VStack(spacing: 20) {
                Text("Choose a Sport!")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Button(action: {
                    isDropdown1Expanded.toggle()
                }) {
                    HStack {
                        Text(selectedOption1)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: isDropdown1Expanded ? "chevron.up" : "chevron.down")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(8)
                }
                
                if isDropdown1Expanded {
                    VStack {
                        ForEach(options1, id: \.self) { option in
                            Button(action: {
                                selectedOption1 = option
                                isDropdown1Expanded = false
                            }) {
                                Text(option)
                                    .foregroundColor(.white)
                                    .padding(.vertical, 8)
                            }
                            .background(Color.secondary.opacity(0.1))
                        }
                    }
                    .padding(.vertical, 4)
                    .cornerRadius(8)
                }
            }
            
            let searchButton = Button(action: {
                switch selectedOption1 {
                case "NFL":
                    apiCall().getNFLBets { fetchedBets in
                        self.bets = fetchedBets
                    }
                case "NBA":
                    apiCall().getNBABets { fetchedBets in
                        self.bets = fetchedBets
                    }
                case "MLB":
                    apiCall().getMLBBets { fetchedBets in
                        self.bets = fetchedBets
                    }
                case "NHL":
                    apiCall().getNHLBets { fetchedBets in
                        self.bets = fetchedBets
                    }
                case "CFB":
                    apiCall().getCFBBets { fetchedBets in
                        self.bets = fetchedBets
                    }
                case "MLS":
                    apiCall().getMLSBets { fetchedBets in
                        self.bets = fetchedBets
                    }
                case "MMA":
                    apiCall().getMMABets { fetchedBets in
                        self.bets = fetchedBets
                    }
                case "IPL":
                    apiCall().getIPLBets { fetchedBets in
                        self.bets = fetchedBets
                    }
                case "Test Cricket":
                    apiCall().getCRICTBets { fetchedBets in
                        self.bets = fetchedBets
                    }
                default:
                    break
                }
            }) {
                Text("Search")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(width: 200, height: 50)
                    .background(Color(hex: "#fe395e"))
                    .cornerRadius(10)
            }

            
            return Color.black
                .ignoresSafeArea()
                .overlay(
                    VStack(spacing: 0) {
                        headerView
                        
                        chooseSportView
                        
                        Spacer()
                        
                        searchButton.padding()
                        
                        Spacer()
                        
                        ScrollView {
                        BetListView(bets: bets)
                        }
                        
                        Spacer()
                        
                        UniversalTabBar()
                    }
                    .edgesIgnoringSafeArea(.all)
                )
        }
    }



struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomepageView()
            
            
            
        }
    }
}



extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
