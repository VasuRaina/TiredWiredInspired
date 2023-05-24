
import SwiftUI
import WebKit

struct NewsView: View {
    @State private var articles: [Article] = []
    @State private var selectedArticle: Article? = nil
    
    var body: some View {
        VStack {
            contentView

            UniversalTabBar()
        }
        .ignoresSafeArea(edges: .all)
        .onAppear {
            getNews()
        }
        .sheet(item: $selectedArticle) { article in
            ArticleDetailView(article: article, dismissAction: { selectedArticle = nil })
        }
    }
    
    private var contentView: some View {
        List(articles) { article in
            Button(action: {
                selectedArticle = article
            }) {
                articleView(article: article)
            }
            .listRowBackground(Color.black)
        }
    }
    
    private func articleView(article: Article) -> some View {
        VStack(alignment: .leading) {
            if let imageUrl = article.urlToImage,
               let imageData = try? Data(contentsOf: imageUrl),
               let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .padding(.bottom, 8)
            }
            
            Text(article.title)
                .font(.headline)
                .foregroundColor(.white)
            
            if let description = article.description {
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color.black)
        .cornerRadius(10)
    }
    
    private func getNews() {
        NewsCall().getNews { fetchedArticles in
            self.articles = fetchedArticles
        }
    }
}
struct ArticleDetailView: View {
    let article: Article
    let dismissAction: () -> Void
    
    var body: some View {
        NavigationView {
            VStack {
                WebView(url: article.url)
                
              
                
                Button(action: dismissAction) {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .padding()
                }
                .background(Color.white)
                .clipShape(Circle())
                .padding(.trailing, 8)
                .padding(.top, 8)
                .frame(maxWidth: .infinity, alignment: .topTrailing)
            }
            .navigationBarHidden(true)
        }
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
