//
//  ContentView.swift
//  Parks
//
//  Created by Shantalia Z on 3/25/24.
//
// AI Translator app
//let urlString = "https://developer.nps.gov/api/v1/parks?stateCode=wa&api_key=hijjfJdhmPG8HghuZX8u4nac1CizfwRYgThBFQEz"



import SwiftUI


struct ContentView: View {

    @State private var parks: [Park] = []

    var body: some View {
        NavigationStack {
            ScrollView {
                    LazyVStack {
                        ForEach(parks) { park in
                            NavigationLink(value: park) {
                                ParkRow(park: park)
                            }
                        }
                    }
                }
            
                
            .padding()
            .onAppear(perform: {
                Task {
                    await fetchParks()
                }
        })
        }
    }

    private func fetchParks() async {
        // URL for the API endpoint
        // 👋👋👋 Make sure to replace {YOUR_API_KEY} in the URL with your actual NPS API Key
        let url = URL(string: "https://developer.nps.gov/api/v1/parks?stateCode=wa&api_key=hijjfJdhmPG8HghuZX8u4nac1CizfwRYgThBFQEz")!
        do {

            // Perform an asynchronous data request | make request
            let (data, _) = try await URLSession.shared.data(from: url)

            // Decode json data into ParksResponse type | convert data
            let parksResponse = try JSONDecoder().decode(ParksResponse.self, from: data)

            // Get the array of parks from the response | create array variable
            let parks = parksResponse.data

            // Print the full name of each park in the array | print each name in the array
            for park in parks {
                print(park.fullName)
            }

            // Set the parks state property | state 
            self.parks = parks

        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView()
}
