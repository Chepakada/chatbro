//
//  ContentView.swift
//  chatbro
//
//  Created by Prashant Lamichhane on 6/13/23.
//
import Firebase
import FirebaseAuth
import FirebaseStorage

import SwiftUI

struct TitleStyle: ViewModifier{
    func body(content: Content) -> some View {
           content
               .font(.largeTitle)
               .foregroundColor(.white)
               .padding()
               .background(Color.black)
       }
}




struct ContentView: View {
    @State private var showLoginView = false
    @State private var showSignupView = false
    
    
    
  
    
    var body: some View {
        VStack (spacing:50){
            
            Text("Welcome to the Chat Bro").modifier(TitleStyle())
            Text("If you have an account with us, press log in, else press sign up.")
                .frame(width:150)
                .multilineTextAlignment(.center)
            
            VStack{
                Button(action: {
                    showLoginView = true
                    
                }) {
                   
                    Text("Login")
                        .sheet(isPresented: $showLoginView){LoginView(isPresented:$showLoginView)}
                }
                Button(action: {
                    showSignupView = true
                }) {
                    
                    Text("Sign Up")
                        .sheet(isPresented: $showSignupView){SignUpView(isPresented: $showSignupView)}
                    
                    
                }
            }}
        .padding()
        
        
        
        
    }
}

struct LoginView: View{
    @Binding var isPresented: Bool
    @State private var UserName = ""
    @State private var Password = ""
    var body: some View{
        ZStack {
            (Image("Image")
                .resizable()
                .frame(width: 30, height: 30)
                .overlay(
                    
                    
                    Button(action:
                            { isPresented = false
                        
                    }) {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 5, height: 5)
                            
                    })).position(x:15, y:15)
            
            VStack{
                Text("Log In")
                    .font(.title)
                
                VStack{TextField("Username", text:$UserName)
                    SecureField("Password", text:$Password)
                    
                }
                VStack{
                    Button(action:{}){Text("Log in").font(.subheadline)}
                }
            }.padding(20)
                .frame(minWidth: 200, minHeight: 400)
        }
    }
}

struct SignUpView: View{
    @Binding var isPresented: Bool
    @State private var firstName:String=""
    @State private var lastName:String=""
    @State private var userName:String=""
    @State private var password:String=""
    @State private var conPassword:String=""
    
    var body:some View{
        ZStack {
            (Image("Image")
                .resizable()
                .frame(width: 30, height: 30)
                .overlay(
                    
                    
                    Button(action:
                            { isPresented = false
                                
                            }) {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .frame(width: 5, height: 5)
                                
                            })).position(x:15, y:15)}
            
        VStack(spacing:30){
                Text("Sign UP")
                    .font(.title)
                VStack(spacing:20){
                    TextField("First Name", text:$firstName)
                    TextField("Last Name", text:$lastName)
                    SecureField("Password", text:$password)
                    SecureField("confirm Password", text:$conPassword)
                }
                Button(action:{}){Text("Sign Up")}
                
             
        }.padding().frame(minWidth: 300)
        }
    }

struct LoginView_Previews:PreviewProvider
    {
    @State private static var showLoginView = true
        static var previews: some View {
            LoginView(isPresented: $showLoginView)
        }
    }

struct Signup_Previews:PreviewProvider
    {
    @State private static var showLoginView = true
        static var previews: some View {
            SignUpView(isPresented: $showLoginView)
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
