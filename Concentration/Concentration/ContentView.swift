import SwiftUI
import SwiftData

struct ContentView: View { // ContentView "Behaves like a" view
  var body: some View { // "some View" means run the code inside and check if it behaves like a view
    //Stacks "return" tuples of items
    HStack {
      CardView(isFaceUp: true) // setting arguments
      CardView()
      CardView(isFaceUp: true)
      CardView()
    }
    .foregroundColor(.purple)
    .padding()
  }
}

struct CardView: View {
  @State var isFaceUp: Bool = false // default value
  // @State creates a pointer to isFaceUp
  var body: some View {
    ZStack {
      // ViewBuilder turns these views (Image, Text) into a TupleView
      let rec = RoundedRectangle(cornerRadius: 15)
      if isFaceUp {
        
        rec // background
          .foregroundColor(.white)
        
        rec // border
          .strokeBorder(lineWidth: 2)
        
        Text("⭐️") // "value" or text for card
          .fontWeight(.bold)
          .font(.largeTitle)
      }
      else {
        rec // default color is inside the ContentView HStack
            // since the color wasn't specified here, it uses
      }     // the HStack (parent) color.

    }
    .onTapGesture {
        isFaceUp = !isFaceUp // pointer doesn't change, but the
                                // value is changed.
        /* we could instead use
         isFaceUp.toggle()
         to do it without @State in the declaration
    }



  }
}























struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView();
  }
}
