import SwiftUI
import SwiftData

struct ContentView: View { // ContentView "Behaves like a" view
  let emojies = ["🚀", "🌎", "⭐️", "🌙", "👾", "🛸", "🌠", "🪐", "☄️",
                 "👨‍🚀", "🛰️", "✨", "🌌", "🌈", "🪄", "🔭"]
  // --> let emojies: [String] = ["🚀", ..]
  // --> let emojies: Array<String> = ["🚀", ..]
  @State var cardCount = 9

  var body: some View { // "some View" means run the code inside and check if it behaves like a view
    VStack {            // Stacks "return" tuples of items inside them
      ScrollView {
        cards
      }
      cardCountAdjusters
    }
    .foregroundColor(.purple)
    .padding()
  }

  var cards: some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
      ForEach(0..<cardCount, id: \.self) /*==ForEach(emojies.indices,)==(0...3,)*/ { index in
        CardView(content: emojies[index])
          .aspectRatio(2/3, contentMode: .fit)
      }
      // CardView(content: emojies[0], isFaceUp: true) // setting arguments
      // CardView(content: emojies[1])
      // CardView(content: emojies[2], isFaceUp: true)
      // CardView(content: emojies[3])
    }
  }
  func cardCountAdjuster(by offset: Int, symbol: String) -> some View { // creates the button guts
    Button(
      action: {
          cardCount += offset
      },
      label: {
        Image(systemName: symbol)
      })
    .disabled(cardCount + offset < 1 || cardCount + offset > emojies.count)
  }
  var cardRemover: some View { // creates the button in UI
    cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
  }
  var cardAdder: some View {
    cardCountAdjuster(by: 1, symbol: "rectangle.stack.badge.plus.fill")
  }
  var cardCountAdjusters: some View { // smashes the buttons togther
    HStack{
      cardRemover
      Spacer()
      cardAdder
    }
    .imageScale(.large) // both imageScale and font change the size
    .font(.largeTitle)  // of the buttons.
    .foregroundColor(.accentColor)
  }

  struct CardView: View {
    var content: String = "0"
    @State var isFaceUp: Bool = true // default value

    // @State creates a pointer to isFaceUp

    var body: some View {
      ZStack {
        // ViewBuilder turns these views (Image, Text) into a TupleView
        let rec = RoundedRectangle(cornerRadius: 15)
        Group {
          rec // background
            .foregroundColor(.white)
          rec // border
            .strokeBorder(lineWidth: 2)
          Text(content) // "value" or text for card
            .fontWeight(.bold)
            .font(.largeTitle)
        }
        .opacity(isFaceUp ? 1 : 0)
        rec.fill().opacity(isFaceUp ? 0 : 1)
      }
      .onTapGesture {
        isFaceUp = !isFaceUp // pointer doesn't change, but the
                             // value is changed.
        /*
         * we could instead use
         * isFaceUp.toggle()
         * to do it without @State in the declaration
         */
      }



    }
  }
}























struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView();
  }
}
