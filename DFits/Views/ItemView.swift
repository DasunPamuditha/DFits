import SwiftUI

struct ItemView: View {
    
    @StateObject var itemVM : ItemViewModel = ItemViewModel()
    @State private var selectedSize: String = ""
    
    var body: some View {
        NavigationView(content: {
            ZStack{
                VStack{
                    VStack(spacing: 20){
                        // Menu Name
                        Text("Long Sleeve").bold()
                        Spacer()
                        Image("item2")
                            .resizable()
                            .cornerRadius(20)
                            .frame(width: 350,height: 400)
                            .scaledToFit()
                        Spacer()
                        VStack{
                            HStack{
                                Text("Long Sleve 16 1/2")
                                Spacer()
                                Text("$ 54.00")
                            }
                            .padding(30)
                        }
                        
                        // Size selection
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(["Small", "Medium", "Large", "XL", "XXL"], id: \.self) { size in
                                    Button(action: {
                                        selectedSize = size
                                        print("Selected size: \(selectedSize)")
                                    }) {
                                        Text(size)
                                            .font(.title)
                                            .padding(7)
                                            .foregroundColor(selectedSize == size ? .black : .white)
                                            .background(selectedSize == size ? Color.gray : Color.color)
                                            .cornerRadius(8)
                                    }
                                }
                            }
                        }
                        .padding()
                        
                        Spacer()
                        
                        // Add to cart button
                        Button(action: {
                            print("adding to cart")
                        }) {
                            HStack{
                                Text("Add to Cart")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                        }
                        .background(Color.blue)
                        .cornerRadius(50)
                    }
                }
            }
            .navigationBarHidden(true)
        })
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
