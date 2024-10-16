//
//  IdeasView.swift
//  App905
//
//  Created by IGOR on 14/10/2024.
//

import SwiftUI

struct IdeasView: View {
    
    @StateObject var viewModel = IdeasViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Spacer()
                    
                    ZStack {
                        
                        Text("Ideas")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                        
                        HStack {
                            
                            Spacer()
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = true
                                }
                                
                            }, label: {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 14, weight: .medium))
                                    .padding(4)
                                    .background(Circle().fill(Color("prim")))
                            })
                            
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim2")))
                .padding(.bottom)
                
                if viewModel.ideas.isEmpty {
                    
                    VStack(spacing: 18) {
                        
                        Text("Empty")
                            .foregroundColor(.white)
                            .font(.system(size: 36, weight: .bold))
                        
                        Text("You don't have any posts, create your first idea")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold))
                            .multilineTextAlignment(.center)
                            .frame(width: 340)
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                                .font(.system(size: 32, weight: .black))
                                .padding(14)
                                .background(Circle().fill(Color("prim")))
                        })
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    VStack {
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.ideas.filter{($0.idType ?? "") == viewModel.typeForFilter}, id: \.self) { index in
                                    
                                    VStack {
                                        
                                        Text(index.idTitle ?? "")
                                            .foregroundColor(Color("prim"))
                                            .font(.system(size: 20, weight: .bold))
                                        
                                        HStack {
                                            
                                            Image(index.idRef1 ?? "")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                            
                                            Image(index.idRef2 ?? "")
                                                .resizable()
                                                .frame(width: 50, height: 50)

                                            Image(index.idRef3 ?? "")
                                                .resizable()
                                                .frame(width: 50, height: 50)
                                        }
                                        
                                        HStack {
                                            
                                            Text(index.idCat ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .medium))
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 45)
                                                .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                                            
                                            Button(action: {
                                                
                                                viewModel.selectedIdea = index
                                                
                                                withAnimation(.spring()) {
                                                    
                                                    viewModel.isDelete = true
                                                }
                                                
                                            }, label: {
                                                
                                                Image(systemName: "trash")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 13, weight: .regular))
                                                    .padding(4)
                                                    .background(Circle().fill(.black))
                                            })
                                        }
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(.white))
                                }
                            }
                        }
                    }
                    .padding()
                }
                
                VStack {
                    
                    Spacer()
                    
                    HStack {
                        
                        ForEach(viewModel.types, id: \.self) { index in
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.typeForFilter = index
                                }
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(viewModel.typeForFilter == index ? .white : .black)
                                    .font(.system(size: 15, weight: .medium))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 50)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim").opacity(viewModel.typeForFilter == index ? 1 : 0)))
                            })
                        }
                    }
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim").opacity(0.4)))
                }
                .padding()
            }
            .ignoresSafeArea()
        }
        .onAppear {
            
            viewModel.fetchIdeas()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddIdea(viewModel: viewModel)
        })
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteIdea(withIdTitle: viewModel.selectedIdea?.idTitle ?? "", completion: {
                            
                            viewModel.fetchIdeas()
                        })
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            
                        }
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color(.white)))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    IdeasView()
}
