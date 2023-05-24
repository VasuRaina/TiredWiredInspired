import SwiftUI

struct UniversalTabBar: View {
    var body: some View {
        let gradient = LinearGradient(
                    gradient: Gradient(colors: [.red, .pink]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
        
        HStack (alignment: .center) {
            NavigationLink(destination: NewsView()) {
                UniversalTabBarButton(imageName: "house", buttonText: "News")
            }
            .buttonStyle(PlainButtonStyle())
            
            NavigationLink(destination: HomepageView()) {
                UniversalTabBarButton(imageName: "magnifyingglass", buttonText: "Bet Search")
            }
            .buttonStyle(PlainButtonStyle())
            
            NavigationLink(destination: FeedView()) {
                UniversalTabBarButton(imageName: "list.bullet.rectangle", buttonText: "Feed")
            }
            .buttonStyle(PlainButtonStyle())
        }
        .background(gradient)
    }
}

struct UniversalTabBarButton: View {
    let imageName: String
    let buttonText: String
    
    var body: some View {
        VStack(spacing: 4) {
            GeometryReader { geo in
                Rectangle()
                    .foregroundColor(.black)
                    .frame(width: geo.size.width / 2, height: 6)
                    .padding(.leading, geo.size.width / 4)
            
            }
            
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            
            Text(buttonText)
        }
        .frame(height: 60)
    }
}

struct UniversalTabBar_Previews: PreviewProvider {
    static var previews: some View {
        UniversalTabBar()
    }
}
