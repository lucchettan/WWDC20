
import PlaygroundSupport
import SwiftUI
import UIKit

//---Kenny Button Start
import AVFoundation

struct KennyBtn: View {
    @Binding var score : Int
    @State var img : UIImage
    // @State var soundEffect: AVAudioPlayer?
    var body: some View {
        Button (action: {
            self.score += 1
            /* Sadly i couldn't find a way to add my personal sound on playground app 
            do {
                self.soundEffect = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: self.path))
                self.soundEffect?.play()
            } catch {
                // couldn't load file :(
            }
 */
        }) {
            Image(uiImage: img)
                .resizable()
                .foregroundColor(Color.black)
                .frame(width: 200, height: 200)
        }.padding()
    }
}
//-----
//-- Kenny struct

struct Kenny: Identifiable {
    let id = UUID()
    let name: String
    var isShown: Bool
    let image: UIImage
}

extension Kenny: Hashable, Equatable {
    static func all() -> [Kenny] {
        return [
            Kenny(name: "kenny0", isShown: false, image: #imageLiteral(resourceName: "box.png")),
            Kenny(name: "kenny1", isShown: false, image: #imageLiteral(resourceName: "construction-and-tools.png")),
            Kenny(name: "kenny2", isShown: false, image: #imageLiteral(resourceName: "day.png")),
            Kenny(name: "kenny3", isShown: false, image: #imageLiteral(resourceName: "fashion.png")),
            Kenny(name: "kenny4", isShown: false, image: #imageLiteral(resourceName: "gestures.png")),
            Kenny(name: "kenny5", isShown: false, image: #imageLiteral(resourceName: "laptop.png")),
            Kenny(name: "kenny6", isShown: false, image: #imageLiteral(resourceName: "professions-and-jobs.png")),
            Kenny(name: "kenny7", isShown: false, image: #imageLiteral(resourceName: "saved.png")),
            Kenny(name: "kenny8", isShown: false, image: #imageLiteral(resourceName: "social-network.png"))
        ]
    }
}
//--
// Black view 
struct BlankView: View {
    var body: some View {
        Text("").frame(width: 135, height: 200).background(Color.white)
    }
}
//--
struct ContentView: View {
    
    let blank = BlankView()
    @State var kennys: [Kenny] = Kenny.all()
    @State var time = 15
    @State var score = 0
    @State var kenny0: Bool = false
    @State var kenny1: Bool = false
    @State var kenny2: Bool = false
    @State var kenny3: Bool = false
    @State var kenny4: Bool = false
    @State var kenny5: Bool = false
    @State var kenny6: Bool = false
    @State var kenny7: Bool = false
    @State var kenny8: Bool = false
    @State var ready: Bool = true
    
    func hideKenny() {
        kenny0 = false
        kenny1 = false
        kenny2 = false
        kenny3 = false
        kenny4 = false
        kenny5 = false
        kenny6 = false
        kenny7 = false
        kenny8 = false
    }
    
    func moveKenny(toShow: Int) {
        if toShow == 0 {
            print("case \(toShow) and its bool value is")
            self.kenny0 = true
            print("\(kenny0)")
        } else if toShow == 1 {
            print("case \(toShow) and its bool value is" )
            self.kenny1 = true
            print("\(kenny1)")
        }  else if toShow == 2 {
            print("case \(toShow) and its bool value is" )
            self.kenny2 = true
            print("\(kenny2)")
        }  else if toShow == 3 {
            print("case \(toShow) and its bool value is" )
            self.kenny3 = true
            print("\(kenny3)")
        }  else if toShow == 4 {
            print("case \(toShow) and its bool value is" )
            self.kenny4 = true
            print("\(kenny4)")
        }  else if toShow == 5 {
            print("case \(toShow) and its bool value is" )
            self.kenny5 = true
            print("\(kenny5)")
        }  else if toShow == 6 {
            print("case \(toShow) and its bool value is" )
            self.kenny6 = true
            print("\(kenny6)")
        }  else if toShow == 7 {
            print("case \(toShow) and its bool value is" )
            self.kenny7 = true
            print("\(kenny7)")
        }  else if toShow == 8 {
            print("case \(toShow) and its bool value is" )
            self.kenny8 = true
            print("\(kenny8)")
        }
    }
    
    func start() {
        self.time = 15
        self.score = 0
        ready = false
        Timer.scheduledTimer(withTimeInterval: 0.55, repeats: true) { timer in
            let random = Int.random(in: 0..<(self.kennys.count - 1))
            self.hideKenny()
            self.moveKenny(toShow: random)
            self.time -= 1
            print("i'm out : time \(self.time)")
            if self.time < 1 {
                self.ready = true
                timer.invalidate()
                self.hideKenny()
            }
        }
    }
    var body: some View {
        VStack {
            HStack {
                Image(uiImage: #imageLiteral(resourceName: "clock.png"))
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("\(time)")
                    .font(.system(size: 30))
            }.offset(y: 19)
            VStack {
                HStack {
                    ZStack {
                        if kenny0 {
                            KennyBtn(score: $score, img: kennys[0].image)
                        } else { BlankView() }
                    }
                    ZStack {
                        if kenny1 {
                            KennyBtn(score: $score, img: kennys[1].image)
                        } else { BlankView() }
                    }
                    ZStack {
                        if kenny2 {
                            KennyBtn(score: $score, img: kennys[2].image)
                        } else { BlankView() }
                    }
                }
                HStack {
                    ZStack {
                        if kenny3 {
                            KennyBtn(score: $score, img: kennys[3].image)
                        } else { BlankView() }
                    }
                    ZStack {
                        if kenny4 {
                            KennyBtn(score: $score, img: kennys[4].image)
                        } else { BlankView() }
                        if ready {
                            Button(action: start){
                                Text(score >= 6 ? "Congratulations! You got the good habits! Please Run the next page to continue the journey! or try again and do better!": "Catch at least 6 of us!")
                                    .bold()
                                    .font(.largeTitle)
                                    .foregroundColor(Color.red)
                                    .lineLimit(7)
                                    .multilineTextAlignment(.center)
                            }
                            .padding(15)
                            .background(Color.white)
                            .cornerRadius(30)
                        }
                    }
                    ZStack {
                        if kenny5 {
                            KennyBtn(score: $score, img: kennys[5].image)
                        } else { BlankView() }
                    }
                }
                HStack {
                    ZStack {
                        if kenny6 {
                            KennyBtn(score: $score, img: kennys[6].image)
                        } else { BlankView()}
                    }
                    ZStack {
                        if kenny7 {
                            KennyBtn(score: $score, img: kennys[7].image)
                        } else { BlankView()}
                    }
                    ZStack {
                        if kenny8 {
                            KennyBtn(score: $score, img: kennys[8].image)
                        } else { BlankView()}
                    }
                }
            }
            
            ZStack (alignment: .center){
                Image(uiImage: #imageLiteral(resourceName: "score.jpeg"))
                    .resizable()
                    .frame(width: 300, height: 160)
                HStack {
                    Text(">6")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.red)
                    Spacer()
                    Text("\(score)")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.black)
                }
                .frame(width: 130)
                .offset(y: 15)
            }
        }
    }
}
//


PlaygroundPage.current.setLiveView(ContentView())
