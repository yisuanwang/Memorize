//
//  ContentView.swift
//  Memorize
//
//  Created by 乙酸王 on 2022/8/9.
//

import SwiftUI

struct ContentView: View {
//    var emojis: [String] = ["🩼","🚄","🚘","🛸"]二者等价
//    var emojis: Array<String> = ["🩼","🚄","🚘","🛸"] 也可以直接缺省
    var emojis = ["🩼","🚄","🚘","🛸","🚄"]
    @State var emojiCount = 4
    var body: some View {
        VStack {
            ScrollView{
//                LazyVGrid(columns: [GridItem(),GridItem(),GridItem()]){
//                    //            ForEach(emojis, id: \.self, content: {emoji in
//                    //                CardView(content: emoji)
//                    //            })
//                    //            最后一个参数可以去掉
//                    //            ForEach(emojis, id: \.self {emoji in
//                    //                CardView(content: emoji)
//                    //            }
//                    ForEach(emojis[0..<emojiCount], id: \.self) {emoji in
//                        CardView(content: emoji)
//                            .aspectRatio(2/3, contentMode: .fit) //卡片长宽比
//                    }
//                }
                
                //通过最小宽度自适应每行卡片数
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojis[0..<emojiCount], id: \.self) {emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit) //卡片长宽比
                    }
                }
            }
            
            .padding()
            Spacer()
            HStack{
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
        }
        
    }
    
    var remove: some View{
        Button(action: {
            if emojiCount > 1{
                emojiCount -= 1
            }
            
        }, label: {
            VStack{
                Image(systemName: "minus.circle")
            }
        })
    }
    
    var add: some View{
        Button {
            if emojiCount < emojis.count{
                emojiCount += 1
            }
            
        } label: {
            VStack{
                Image(systemName: "plus.circle")
            }
        }
    }
    
}



struct CardView: View{
    var content: String
    @State var isFaceUp:  Bool = true
    
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            if isFaceUp{
                shape.fill().foregroundColor(.white)
//                shape.stroke(lineWidth: 3)
                shape.strokeBorder(lineWidth: 3) //防止边界被scrollview切断
                Text(content).font(.largeTitle)
            } else{
                shape.fill()
            }
        }
        .foregroundColor(.red)
        .onTapGesture {
            //点击事件
            isFaceUp = !isFaceUp
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
            
    }
}
