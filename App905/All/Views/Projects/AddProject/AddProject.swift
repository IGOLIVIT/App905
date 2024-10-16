//
//  AddProject.swift
//  App905
//
//  Created by IGOR on 14/10/2024.
//

import SwiftUI

struct AddProject: View {

    @StateObject var viewModel: ProjectsViewModel
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    Spacer()
                    
                    ZStack {
                        
                        Text("Projects")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .medium))
                        
                        HStack {
                            
                            Button(action: {
                                
                                viewModel.prTitle = ""
                                viewModel.prDescr = ""
                                viewModel.currentImage1 = ""
                                viewModel.currentImage2 = ""
                                viewModel.currentImage3 = ""
                                viewModel.currentCategory = ""
                                viewModel.currentWel = ""
                                                                
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
                                
                                viewModel.prTool1 = viewModel.currentImage1
                                viewModel.prTool2 = viewModel.currentImage2
                                viewModel.prTool3 = viewModel.currentImage3
                                viewModel.prCat = viewModel.currentCategory
                                viewModel.prPhoto = viewModel.currentWel
                                
                                viewModel.addProj()
                                
                                viewModel.prTitle = ""
                                viewModel.prDescr = ""
                                viewModel.currentImage1 = ""
                                viewModel.currentImage2 = ""
                                viewModel.currentImage3 = ""
                                viewModel.currentCategory = ""
                                
                                viewModel.fetchProjs()
                                
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
                            .opacity(viewModel.prTitle.isEmpty || viewModel.prDescr.isEmpty || viewModel.currentCategory.isEmpty ? 0.5 : 1)
                            .disabled(viewModel.prTitle.isEmpty || viewModel.prDescr.isEmpty || viewModel.currentCategory.isEmpty ? true : false)
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
                        
                        Menu(content: {
                            
                            ForEach(viewModel.welpap, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.currentWel = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                    
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentWel.isEmpty {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                                    .font(.system(size: 28, weight: .bold))
                                    .padding(10)
                                    .background(Circle().fill(Color("prim")))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 140)
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                                    .padding(1)
                                
                            } else {
                                
                                Image(viewModel.currentWel)
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 140)
                                    .padding(1)
                            }
                        })
                       
                        HStack {
                            
                            Text("Title")
                                .foregroundColor(Color.black)
                                .font(.system(size: 16, weight: .medium))
                            
                            ZStack(content: {
                                
                                Text("Text")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.system(size: 14, weight: .regular))
                                    .opacity(viewModel.prTitle.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.prTitle)
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
                                    .opacity(viewModel.prDescr.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.prDescr)
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
                            
                            if viewModel.currentCategory.isEmpty {
                                
                                HStack {
                                    
                                    Text("Category")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                }
                                
                            } else {
                                
                                HStack {
                                    
                                    Text(viewModel.currentCategory)
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                }
                            }
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                        
                        Text("Tools")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .semibold))
                            .padding(.vertical)
                        
                        HStack {
                            
                            Menu(content: {
                                
                                ForEach(viewModel.tools, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentImage1 = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                        
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
                                        .frame(width: 50, height: 50)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 120)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                }
                                
                            })
                            
                            Menu(content: {
                                
                                ForEach(viewModel.tools, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentImage2 = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                        
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
                                        .frame(width: 50, height: 50)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 120)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                }
                                
                            })
                            
                            Menu(content: {
                                
                                ForEach(viewModel.tools, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentImage3 = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                        
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
                                        .frame(width: 50, height: 50)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 120)
                                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
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
    AddProject(viewModel: ProjectsViewModel())
}
