//
//  FQAdvanceView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2021/12/22.
//

import SwiftUI

struct FQAdvanceView: View {
    @EnvironmentObject var tabBar: TabBarState
    
    private let listData: [ListData] = [
        ListData(sectionIndex: 0, sectionText: "进阶", sectionData: [
            ListData.SectionData(index: 0, title: "GeometryReader", subTitle: "通过GeometryProxy获取父容器布局的相关信息"),
            ListData.SectionData(index: 1, title: "PreferenceKey", subTitle: "通过GeometryReader和PreferenceKey获取任意容器布局的相关信息"),
            ListData.SectionData(index: 2, title: "ScrollViewReader", subTitle: "ScrollView滚动到指定位置"),
            ListData.SectionData(index: 3, title: "ViewModifier", subTitle: "视图修改器协议：可封装一些view的特定属性"),
            ListData.SectionData(index: 4, title: "渐变色", subTitle: ""),
            ListData.SectionData(index: 5, title: "位置", subTitle: "调整布局的位置或偏移"),
            ListData.SectionData(index: 6, title: "refreshable", subTitle: "系统下拉刷新，暂无上拉加载"),

        ]),

        ListData(sectionIndex: 1, sectionText: "UIKit", sectionData: [
            ListData.SectionData(index: 0, title: "webView", subTitle: "加载网页HTML(WKWebView)，使用UIView"),
            ListData.SectionData(index: 1, title: "UIViewController", subTitle: "SwiftUI使用UIViewController"),
        ]),
        
        ListData(sectionIndex: 2, sectionText: "动画&奇淫技巧", sectionData: [
            ListData.SectionData(index: 0, title: "汽车仪表板", subTitle: "观察、安全带、挂挡、手刹、起步、下车"),
            ListData.SectionData(index: 1, title: "旋转的圆", subTitle: "爱的魔力转圈圈"),
            ListData.SectionData(index: 2, title: "卡片墙", subTitle: "悬挂在墙上的卡片"),
            ListData.SectionData(index: 3, title: "卡片抽出动画", subTitle: "叠放的卡片旋转展示"),
            ListData.SectionData(index: 4, title: "轮播图", subTitle: "可自动轮播、可手动拖拽"),
        ]),
    ]
    var body: some View {
        List {
            ForEach(listData, content: {section in
                Section {
                    ForEach(section.sectionData) {item in
                        NavigationLink {
                            switch section.sectionIndex {
                            case 0:
                                switch item.index {
                                case 0:
                                    FQGeometryReaderView()
                                case 1:
                                    FQViewFrame()
                                case 2:
                                    FQScrollViewReaderView()
                                case 3:
                                    FQViewModifierView()
                                case 4:
                                    Text("Gradient Text")
                                        .font(.largeTitle)
                                        .foregroundStyle(
                                            .linearGradient(
                                                colors: [.yellow, .blue],
                                                startPoint: .top,
                                                endPoint: .bottom
                                            )
                                        )
                                        .navigationBarTitle("渐变色")
                                case 5:
                                    FQPositionView()
                                case 6:
                                    FQRefreshView()
                                default:
                                    EmptyView()
                                }
                            case 1:
                                switch item.index {
                                case 0:
                                    FQUIViewCategory<FQWebView>()
                                case 1:
                                    FQControllerCategory<FQLoginViewController>()
                                default:
                                    EmptyView()
                                }
                            case 2:
                                switch item.index {
                                case 0:
                                    FQMeterManageView()
                                case 1:
                                    FQCircleRotateView()
                                case 2:
                                    FQCardWallView()
                                case 3:
                                    FQCardShowView()
                                case 4:
                                    let arr =  [
                                        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F201804%2F09%2F20180409134033_vKAfa.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1643867460&t=08341d7b35ed0b6aa5a5c5cebcd5a4b4",
                                        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Finews.gtimg.com%2Fnewsapp_match%2F0%2F12045754326%2F0.jpg&refer=http%3A%2F%2Finews.gtimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1643867460&t=26feb5e831093644ce210b8d6679b200",
                                        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Finews.gtimg.com%2Fnewsapp_bt%2F0%2F14045763624%2F1000.jpg&refer=http%3A%2F%2Finews.gtimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1643867460&t=dc21d1b9c44f7e9dc16a6d7262a22e29",
                                        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Finews.gtimg.com%2Fnewsapp_match%2F0%2F12031315515%2F0.jpg&refer=http%3A%2F%2Finews.gtimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1643867460&t=f7d2e12e3d6423f7ab258dc99f5ffd7d",
                                        "https://pics2.baidu.com/feed/9a504fc2d56285351c97db3cda367ec0a6ef6393.jpeg?token=5556f1667a88f60cc67541ee6c47924b&s=275832DD6231739C36945C370300E064",
                                        "https://pics3.baidu.com/feed/8644ebf81a4c510fa29f2d06b7a0242ad52aa550.jpeg?token=b6babe2045ba4a544409e4d3bced454e",
                                        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic3.zhimg.com%2F50%2Fv2-e47113b5b2c157a5071020c14f44d1b8_hd.jpg&refer=http%3A%2F%2Fpic3.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1643867460&t=378cfb429d6a5150c36288bcf5994b03"]
                                    FQBannerView(imageUrls: arr)
                                default:
                                    EmptyView()
                                }
                            default:
                                EmptyView()
                            }
                        } label: {
                            FQTableViewCell(title: item.title, subTitle: item.subTitle)
                        }
                    }
                } header: {
                    Text(section.sectionText)
                }
            })
        }.navigationBarTitle("FQSwiftUI进阶")
            .onAppear {
                self.tabBar.hidden = false
            }
    }
}



struct FQAdvanceView_Previews: PreviewProvider {
    static var previews: some View {
        FQAdvanceView()
    }
}
