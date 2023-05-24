//
//  BetService.swift
//  TiredWiredInspired
//
//  Created by Vasu Raina on 5/16/23.
//

import Foundation
import SwiftUI


class apiCall {
    
    @State private var api_key = "f75944465c8dcec181a86e21184b46ce"
    

    
    func getNFLBets(completion: @escaping ([Bet]) -> ()) {
        guard let url = URL(string: "https://api.the-odds-api.com/v4/sports/americanfootball_nfl/odds/?apiKey=f75944465c8dcec181a86e21184b46ce&regions=us&markets=h2h&oddsFormat=american") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let bets = try decoder.decode([Bet].self, from: data)
                DispatchQueue.main.async {
                    completion(bets)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    func getNBABets(completion: @escaping ([Bet]) -> ()) {
        guard let url = URL(string: "https://api.the-odds-api.com/v4/sports/basketball_nba/odds/?apiKey=f75944465c8dcec181a86e21184b46ce&regions=us&markets=h2h&oddsFormat=american") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error: \(error)")
                completion([])
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion([])
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let bets = try decoder.decode([Bet].self, from: data)
                DispatchQueue.main.async {
                    completion(bets)
                }
            } catch {
                print("Error decoding JSON: \(error)")
                completion([])
            }
        }.resume()
    }


    
    func getMLBBets(completion: @escaping ([Bet]) -> ()) {
        guard let url = URL(string: "https://api.the-odds-api.com/v4/sports/baseball_mlb/odds/?apiKey=f75944465c8dcec181a86e21184b46ce&regions=us&markets=h2h&oddsFormat=american") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let bets = try decoder.decode([Bet].self, from: data)
                DispatchQueue.main.async {
                    completion(bets)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    func getNHLBets(completion: @escaping ([Bet]) -> ()) {
        guard let url = URL(string: "https://api.the-odds-api.com/v4/sports/icehockey_nhl/odds/?apiKey=f75944465c8dcec181a86e21184b46ce&regions=us&markets=h2h&oddsFormat=american") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let bets = try decoder.decode([Bet].self, from: data)
                DispatchQueue.main.async {
                    completion(bets)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    func getCFBBets(completion: @escaping ([Bet]) -> ()) {
        guard let url = URL(string: "https://api.the-odds-api.com/v4/sports/americanfootball_ncaaf/odds/?apiKey=f75944465c8dcec181a86e21184b46ce&regions=us&markets=h2h&oddsFormat=american") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let bets = try decoder.decode([Bet].self, from: data)
                DispatchQueue.main.async {
                    completion(bets)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    func getMLSBets(completion: @escaping ([Bet]) -> ()) {
        guard let url = URL(string: "https://api.the-odds-api.com/v4/sports/soccer_usa_mls/odds/?apiKey=f75944465c8dcec181a86e21184b46ce&regions=us&markets=h2h&oddsFormat=american") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let bets = try decoder.decode([Bet].self, from: data)
                DispatchQueue.main.async {
                    completion(bets)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    func getIPLBets(completion: @escaping ([Bet]) -> ()) {
        guard let url = URL(string: "https://api.the-odds-api.com/v4/sports/cricket_ipl/odds/?apiKey=f75944465c8dcec181a86e21184b46ce&regions=us&markets=h2h&oddsFormat=american") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let bets = try decoder.decode([Bet].self, from: data)
                DispatchQueue.main.async {
                    completion(bets)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    func getCRICTBets(completion: @escaping ([Bet]) -> ()) {
        guard let url = URL(string: "https://api.the-odds-api.com/v4/sports/cricket_test_match/odds/?apiKey=f75944465c8dcec181a86e21184b46ce&regions=us&markets=h2h&oddsFormat=american") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let bets = try decoder.decode([Bet].self, from: data)
                DispatchQueue.main.async {
                    completion(bets)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    func getMMABets(completion: @escaping ([Bet]) -> ()) {
        guard let url = URL(string: "https://api.the-odds-api.com/v4/sports/mma_mixed_martial_arts/odds/?apiKey=f75944465c8dcec181a86e21184b46ce&regions=us&markets=h2h&oddsFormat=american") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let bets = try decoder.decode([Bet].self, from: data)
                DispatchQueue.main.async {
                    completion(bets)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
}
