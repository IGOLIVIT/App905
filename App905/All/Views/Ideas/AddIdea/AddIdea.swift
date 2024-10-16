//
//  AddIdea.swift
//  App905
//
//  Created by IGOR on 14/10/2024.
//

import SwiftUI

struct AddIdea: View {
    
    @StateObject var viewModel: IdeasViewModel
    
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
                            
                            Button(action: {
                                
                                viewModel.idTitle = ""
                                viewModel.idDescr = ""
                                viewModel.currentImage1 = ""
                                viewModel.currentImage2 = ""
                                viewModel.currentImage3 = ""
                                viewModel.currentCategory = ""
                                viewModel.currentType = ""
                                                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = false
                                }
                                
                            }, label: {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 17, weight: .medium))
                                
                                Text("Cancel")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 17, weight: .regular))
                            })
                            
                            Spacer()
                            
                            Button(action: {
                                
                                viewModel.idRef1 = viewModel.currentImage1
                                viewModel.idRef2 = viewModel.currentImage2
                                viewModel.idRef3 = viewModel.currentImage3
                                viewModel.idType = viewModel.currentType
                                viewModel.idCat = viewModel.currentCategory
                                
                                viewModel.addIdea()
                                
                                viewModel.idTitle = ""
                                viewModel.idDescr = ""
                                viewModel.currentImage1 = ""
                                viewModel.currentImage2 = ""
                                viewModel.currentImage3 = ""
                                viewModel.currentCategory = ""
                                viewModel.currentType = ""
                                
                                viewModel.fetchIdeas()
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = false
                                }
                                
                            }, label: {
                                
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 14, weight: .medium))
                                    .padding(4)
                                    .background(Circle().fill(Color("prim")))
                            })
                            .opacity(viewModel.idTitle.isEmpty || viewModel.idDescr.isEmpty || viewModel.currentCategory.isEmpty ? 0.5 : 1)
                            .disabled(viewModel.idTitle.isEmpty || viewModel.idDescr.isEmpty || viewModel.currentCategory.isEmpty ? true : false)
                        }
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 90)
                .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim2")))
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 10) {
                        
                        HStack {
                            
                            ForEach(viewModel.types, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.currentType = index
                                    }
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(viewModel.currentType == index ? .white : .black)
                                        .font(.system(size: 15, weight: .medium))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim").opacity(viewModel.currentType == index ? 1 : 0)))
                                })
                            }
                        }
                        .padding(4)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim").opacity(0.4)))
                        
                        HStack {
                            
                            Text("Title")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("Text")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.idTitle.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.idTitle)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        HStack {
                            
                            Text("Description")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("Text")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.idDescr.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.idDescr)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                            
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .frame(height: 200, alignment: .top)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        Menu(content: {
                            
                            ForEach(viewModel.categories, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentCategory = index
                                    
                                }, label: {

                                    Text(index)
                                })
                            }
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("Category")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .medium))
                            }
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        Text("References")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                            .padding(.vertical)
                        
                        HStack {
                            
                            Menu(content: {
                                
                                ForEach(viewModel.images, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentImage1 = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                        
                                        Text(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentImage1.isEmpty {
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(.black)
                                        .font(.system(size: 28, weight: .bold))
                                        .padding(10)
                                        .background(Circle().fill(Color("prim")))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 120)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.currentImage1)
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 120)
                                }
                                
                            })
                            
                            Menu(content: {
                                
                                ForEach(viewModel.images, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentImage2 = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                        
                                        Text(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentImage2.isEmpty {
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(.black)
                                        .font(.system(size: 28, weight: .bold))
                                        .padding(10)
                                        .background(Circle().fill(Color("prim")))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 120)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.currentImage2)
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 120)
                                }
                                
                            })
                            
                            Menu(content: {
                                
                                ForEach(viewModel.images, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentImage3 = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                        
                                        Text(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentImage3.isEmpty {
                                    
                                    Image(systemName: "plus")
                                        .foregroundColor(.black)
                                        .font(.system(size: 28, weight: .bold))
                                        .padding(10)
                                        .background(Circle().fill(Color("prim")))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 120)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.currentImage3)
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 120)
                                }
                            })
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    AddIdea(viewModel: IdeasViewModel())
}
