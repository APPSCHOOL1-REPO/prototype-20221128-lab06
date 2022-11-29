//
//  HomeView.swift
//  BootCamping
//
//  Created by Donghoon Bae on 2022/11/14.
//

import SwiftUI

struct HomeView: View {
    @Binding var selection: Int
    @EnvironmentObject var placeStore: PlaceStore
    let images = ["car", "back", "camp", "gl"]
    
    @State private var userNickName: String = "멋사"
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading){
                //배너 뷰
                Group{      // 배너
                    VStack {
                        HStack {
                            Text("나의 추억")
                                .font(.title)
                                .bold()
                                .padding(.leading)
                                .padding(.top)
                            Spacer()
                            NavigationLink {
                                MyPageView()
                            } label: {
                                Image(systemName: "person.fill")
                                    .foregroundColor(.indigo)
                                    .font(.title)
                            }
                            .padding(.top, 9)
                            .padding(.trailing, 18)
                        }
                        //미니 포토카드 뷰

                        HomePhotoCards()
                            .frame(height: 300)
                            .padding(. vertical, 10)
                        Text("추천 게시판")
                            .font(.title)
                            .bold()
                            .padding(.leading, -185)
                        //배너 뷰
                        TabView {
                            ForEach(images, id: \.self) { item in
                                Image(item)
                                    .resizable()
                                
                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .frame(width: 400,height: 300)
                    }
                }
                Spacer()
                
                
                //카테고리
                HomeCategory(selection: $selection)
                    .padding(.horizontal, 10)
                
                //추천 여행지
                RecommendHomeView(userNickName: $userNickName)
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView(selection: .constant(1))
    }
}

