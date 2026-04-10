import SwiftUI

struct RandomQuestionView: View {
    
    var selectedLevel: Int
    
    @Environment(\.dismiss) var dismiss
    @State private var viewModel = RandomQuestionViewModel()
    @State private var isOpen = false
    @State private var showCard = false
    
    var body: some View {
        ZStack {
            AppBackground{
                if viewModel.isFinished {
                    
                    VStack(spacing: 30) {
                        
                        Spacer()
                        
                        Text("Congratulations!")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .shadow(color: .black.opacity(0.1), radius: 5)
                        
                        Text(congratBodyText)
                            .font(.system(size: 20))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                            .lineSpacing(4)
                        
                        Spacer()
                        Spacer()
                        
                    }
                    .transition(.asymmetric(insertion: .opacity, removal: .opacity))
                    
                } else {
                    
                    VStack(spacing: 30) {
                        
                        Text(isOpen ? "" : "Click To Open!")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.bold)
                            .transition(.opacity)
                            .offset(x: 0, y: 80)
                        
                        ZStack {
                            if !isOpen {
                                
                                Image("CloseEnvelopeFrame")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 420, height: 420)
                                    .onTapGesture {
                                        
                                        isOpen = true
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                            withAnimation(.easeOut(duration: 0.5)) {
                                                showCard = true
                                            }
                                        }
                                    }
                            } else {
                                
                                ZStack {
                                    Image("OpenEnvelopeFrame")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 420)
                                        .offset(y: 40)
                                        .blur(radius: showCard ? 8 : 0)
                                        .animation(.easeInOut(duration: 0.5), value: showCard)
                                    
                                    if showCard {
                                        
                                        VStack {
                                            if let question = viewModel.currentQuestion?.question {
                                                Text(question)
                                                    .font(.system(size: 20, weight: .medium, design: .rounded))
                                                    .multilineTextAlignment(.center)
                                                    .padding(30)
                                            } else {
                                                Text("Loading")
                                                    .font(.system(size: 40, weight: .medium, design: .rounded))
                                            }
                                        }
                                        .frame(width: 300, height: 200)
                                        .background(Color.white)
                                        .cornerRadius(20)
                                        .shadow(radius: 10)
                                        .offset(y: 50)
                                        .transition(.move(edge: .bottom).combined(with: .opacity))
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                        
                        if showCard {
                            Button(action: {
                                
                                //                                                        showCard = false
                                //                                                        isOpen = false
                                //                            
                                viewModel.nextQuestion()
                            }) {
                                Text("Next Question")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .clipShape(Capsule())
                            }
                            .padding(.horizontal, 40)
                            .padding(.bottom, 30)
                        }
                    }
                }
            }
        }
        //        .navigationTitle(viewModel.levelTitle)
        //        .navigationBarTitleDisplayMode(.inline)
        //        .navigationBarBackButtonHidden(true)
        //        .toolbar {
        //            ToolbarItem(placement: .navigationBarLeading) {
        //                Button(action: { dismiss() }) {
        //                    Image(systemName: "chevron.left")
        //                        .fontWeight(.bold)
        //                }
        //            }
        //        }
        
        .onAppear {
            viewModel.startLevel(selectedLevel)
        }
    }
    
    var congratBodyText: String {
        if selectedLevel == 3 {
            return "You have finished this section. Hope you now know each other better!"
        } else {
            return "You have finished this section. You may level up to explore deeper topics if you feel comfortable."
        }
    }
}

#Preview {
    NavigationStack {
        RandomQuestionView(selectedLevel: 1)
    }
}
