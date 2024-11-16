import SwiftUI
import SwiftData

struct ContentView: View {
  var body: some View { // "some View" means run the code inside and check if it behaves like a view
    VStack {
      // ViewBuilder turns these views (Image, Text) into a TupleView
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("Hello World!")
        .padding()
    }
    .imageScale(.large)
    .foregroundColor(.accentColor)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView();
  }
}
