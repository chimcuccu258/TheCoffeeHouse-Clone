//
//  LoginView.swift
//  TheCoffeeHouse-Clone
//
//  Created by Nga Vũ on 02/11/2023.
//

import SwiftUI
import CountryPicker

struct LoginView: View {
    @State var phoneNumber = ""
    @State var isShowPicker: Bool = false
    @State var countryObj: Country?
    
    var body: some View {
        VStack {
            Image("Background2")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .screenWidth)
                .aspectRatio(contentMode: .fill)
                .frame(maxHeight: .screenHeight, alignment: .topTrailing)
                .padding(.bottom, .screenHeight * 0.01)
            
            
            Text("Chào mừng bạn đến với")
                .font(.system(size: 18, design: .default))
                .foregroundColor(.black)
                .padding()
            
            Image("Logo2")
                .resizable()
                .scaledToFit()
                .frame(width: .screenWidth * 0.8, height: .screenHeight * 0.05)
            
            Text("Hãy nhập số điện thoại của bạn để tiếp tục")
                .font(.system(size: 18, design: .default))
                .foregroundColor(.black)
                .padding()
            
            HStack {
                Button {
                    isShowPicker = true
                } label: {
                    if let countryObj = countryObj {
                        Text("\(countryObj.isoCode.getFlag())")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.primaryText)
                        
                        Text("\(countryObj.phoneCode)")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.primaryText)
                    }
                }
                
                Divider()
                    .frame(height: .screenHeight * 0.05)
                
                TextField("Số điện thoại", text: $phoneNumber)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.system(size: 18, design: .default))
                    .foregroundColor(.black)
                    .keyboardType(.numberPad)
                    .onChange(of: phoneNumber) { newValue in
                        if newValue.count > 9 {
                            phoneNumber = String(newValue.prefix(9))
                        }
                    }
            }
            .frame(width: .screenWidth * 0.75, height: .screenHeight * 0.06)
            .padding(EdgeInsets(
                top: 0,
                leading: .screenWidth * 0.1,
                bottom: .screenHeight * 0.02,
                trailing: .screenWidth * 0.1))
            
            RoundButton(title: "Đăng nhập")
                .padding(.bottom, .screenHeight * 0.02)
            
            
            HStack {
                Text("Bạn chưa có tài khoản?")
                    .font(.system(size: 16, design: .default))
                    .foregroundColor(.black)
                
                NavigationLink(destination: SigninView()) {
                    Text("Đăng ký")
                        .font(.system(size: 16, design: .default))
                        .foregroundColor(Color.primaryApp)
                }
            }
            .padding(.bottom, .screenHeight * 0.02)
            
            HStack(alignment: .center) {
                HStack {
                    Spacer()
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: 100, height: 1)
                    Text("Hoặc")
                        .font(.system(size: 16, design: .default))
                        .foregroundColor(.gray)
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: 100, height: 1)
                    Spacer()
                }
            }
            .padding(.bottom, .screenHeight * 0.02)
            
            Button {
                // Xử lý sự kiện khi nút được nhấn
            } label: {
                HStack {
                    Image("google")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: .screenWidth * 0.1, height: .screenHeight * 0.03)
                    
                    Text("Đăng nhập với Google")
                        .font(.system(size: 16, design: .default))
                        .foregroundColor(Color.blue)
                }
            }
            .frame(width: .screenWidth * 0.75, height: .screenHeight * 0.06)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 1)
            )
            .cornerRadius(10)
            
            Button {
                // Xử lý sự kiện khi nút được nhấn
            } label: {
                HStack {
                    Image("facebook")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: .screenWidth * 0.1, height: .screenHeight * 0.03)
                    
                    Text("Đăng nhập với Facebook")
                        .font(.system(size: 16, design: .default))
                        .foregroundColor(Color.blue)
                }
            }
            .frame(width: .screenWidth * 0.75, height: .screenHeight * 0.06)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 1)
            )
            .cornerRadius(10)
            .padding(.bottom, .screenHeight * 0.15)
        }
        .foregroundColor(.white)
        .onAppear {
            self.countryObj = Country(phoneCode: "+84", isoCode: "VN")
        }
        .sheet(isPresented: $isShowPicker, content: {
            CountryPicker(country: $countryObj)
        })
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        LoginView()
    }
}

