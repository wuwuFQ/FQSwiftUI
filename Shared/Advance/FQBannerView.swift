//
//  FQBannerView.swift
//  FQSwiftUI (iOS)
//
//  Created by TKiOS on 2022/1/2.
//

import SwiftUI
/* *轮播图原理：
 *有很多种方案可以实现轮播的功能，我采用的是首尾多增加数据
 *一共4个图片需要轮播  0 1 2 3
 *改造后： 3 0 1 2 3 0
 *当index==0，改为index=4
 *当index==5，改为index=1
 */

struct FQBannerView: View {
    
    private var imageUrls: [String] = [""]
    
    /// SwiftUI对定时器的简化，可以进去看看具体参数的定义
    private let timer = Timer.publish(every: 3, on: .main, in: .default).autoconnect()
    
    ///当前显示的位置索引,
    ///这是实际数据中的1就是数据没有被处理之前的0位置的图片
    ///所以这里默认从1开始
    @State var currentIndex: Int = 1
    /// 拖拽的偏移量
    @State var dragOffset: CGFloat = .zero
    
    let spacing: CGFloat = 20
    let frameHeight: CGFloat = 200
    init(imageUrls: [String]) {
        var tempArr = imageUrls
        tempArr.insert(imageUrls.last ?? "", at: 0)
        tempArr.append(imageUrls.first ?? "")
        self.imageUrls = tempArr
    }
    var body: some View {
        
        /// 单个子视图偏移量
        let currentOffset = CGFloat(currentIndex) * (FQScreenWidth-spacing*3) + (spacing*0.5*CGFloat(currentIndex-1)) - spacing
            
            HStack(spacing: spacing*0.5){
                
                ForEach(0..<imageUrls.count){ index in
                    AsyncImage(url: URL(string: imageUrls[index])) { image in
                        if let imgView = image {
                            imgView
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                        }
                    } placeholder: {
                        Color.orange
                    }
                    .frame(width: FQScreenWidth - spacing*3,
                           height: index == currentIndex ? frameHeight:frameHeight*0.8 )
                    .clipped() /// 裁减
                    .cornerRadius(10)
                    .tag(index - 1)
                    .onTapGesture {
                        print("wuwuFQ:点击了\(index - 1)")
                        FQToast.toast("点击了\(index - 1)")
                    }
                }
            }
            .frame(width: FQScreenWidth,
                    height: frameHeight,alignment: .leading)
             .offset(x: dragOffset - currentOffset)
             .gesture(dragGesture)
             /// 监听当前索引的变化,最开始初始化是不监听的，
             .onChange(of: currentIndex, perform: { value in
            
                /// 第一张的时候
                if value == 0 {
                    currentIndex = imageUrls.count - 2
                }else if value == imageUrls.count - 1 {
                    currentIndex = 1
                }
                 
             })
             /// 对定时器的监听
             .onReceive(timer, perform: { _ in
                 if dragOffset == .zero {
                     withAnimation(.spring()) {
                         currentIndex += 1
                     }
                 }
             })
             .navigationTitle("轮播图")
    }
    
}

// MARK: -
extension FQBannerView {
    
    /// 定义拖拽手势
    private var dragGesture: some Gesture{
        
        DragGesture()
            /// 拖动改变
            .onChanged {
                print("wuwuFQ:\($0.translation.width)")
                dragOffset = $0.translation.width
            }
            /// 结束
            .onEnded {
                dragOffset = .zero
                /// 拖动右滑，偏移量增加，显示 index 减少
                if $0.translation.width > 80{
                    withAnimation(.spring()) {
                    currentIndex -= 1
                    }
                }
                /// 拖动左滑，偏移量减少，显示 index 增加
                if $0.translation.width < -80{
                    withAnimation(.spring()) {
                    currentIndex += 1
                    }
                }
                /// 防止越界
                withAnimation(.spring()) {
                currentIndex = max(min(currentIndex, imageUrls.count - 1), 0)
                }
            }
    }
}


struct FQBannerView_Previews: PreviewProvider {
    static var previews: some View {
        let arr =  [
            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F201804%2F09%2F20180409134033_vKAfa.thumb.1000_0.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1643867460&t=08341d7b35ed0b6aa5a5c5cebcd5a4b4",
            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Finews.gtimg.com%2Fnewsapp_match%2F0%2F12045754326%2F0.jpg&refer=http%3A%2F%2Finews.gtimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1643867460&t=26feb5e831093644ce210b8d6679b200",
            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Finews.gtimg.com%2Fnewsapp_bt%2F0%2F14045763624%2F1000.jpg&refer=http%3A%2F%2Finews.gtimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1643867460&t=dc21d1b9c44f7e9dc16a6d7262a22e29",
            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Finews.gtimg.com%2Fnewsapp_match%2F0%2F12031315515%2F0.jpg&refer=http%3A%2F%2Finews.gtimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1643867460&t=f7d2e12e3d6423f7ab258dc99f5ffd7d",
            "https://pics2.baidu.com/feed/9a504fc2d56285351c97db3cda367ec0a6ef6393.jpeg?token=5556f1667a88f60cc67541ee6c47924b&s=275832DD6231739C36945C370300E064",
            "https://pics3.baidu.com/feed/8644ebf81a4c510fa29f2d06b7a0242ad52aa550.jpeg?token=b6babe2045ba4a544409e4d3bced454e",
            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic3.zhimg.com%2F50%2Fv2-e47113b5b2c157a5071020c14f44d1b8_hd.jpg&refer=http%3A%2F%2Fpic3.zhimg.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1643867460&t=378cfb429d6a5150c36288bcf5994b03"]
        FQBannerView(imageUrls: arr)
    }
}
