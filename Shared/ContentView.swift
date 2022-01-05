//
//  ContentView.swift
//  Shared
//
//  Created by TKiOS on 2021/12/9.
//

import SwiftUI
private struct ListData: Identifiable {
    let id = UUID()
    let sectionIndex: Int
    let sectionText: String
    let sectionData: [SectionData]
    struct SectionData: Identifiable {
        let id = UUID()
        let index: Int
        let title: String
        let subTitle: String?
    }
}


struct ContentView: View {
    private let listData: [ListData] = [
        ListData(sectionIndex: 0, sectionText: "基础控件", sectionData: [
            ListData.SectionData(index: 0, title: "Text", subTitle: "显示一行或多行只读文本(UILabel)"),
            ListData.SectionData(index: 1, title: "TextField", subTitle: "可编辑文本界面的单行输入控件"),
            ListData.SectionData(index: 2, title: "TextEditor", subTitle: "可编辑文本界面的多行输入控件(UITextView)"),
            ListData.SectionData(index: 3, title: "Button", subTitle: "不是UIButton，是一个自带点击事件的View"),
            ListData.SectionData(index: 4, title: "Image", subTitle: "展示图片，本地/网络")
        ]),
        
        ListData(sectionIndex: 1, sectionText: "选择器", sectionData: [
            ListData.SectionData(index: 0, title: "Toggle", subTitle: "开关状态切换(UISwitch)"),
            ListData.SectionData(index: 1, title: "Stepper", subTitle: "步进器"),
            ListData.SectionData(index: 2, title: "Slider", subTitle: "进度器"),
            ListData.SectionData(index: 3, title: "Picker", subTitle: "自定义数据源的多列选择器"),
            ListData.SectionData(index: 4, title: "DatePicker", subTitle: "日期选择器"),
        ]),
        
        ListData(sectionIndex: 2, sectionText: "layout布局", sectionData: [
            ListData.SectionData(index: 0, title: "VStack", subTitle: "子视图竖向排列，默认模式"),
            ListData.SectionData(index: 1, title: "HStack", subTitle: "子视图横向排列"),
            ListData.SectionData(index: 2, title: "ZStack", subTitle: "子视图覆盖，中心点重叠"),
            ListData.SectionData(index: 3, title: "Grid", subTitle: "子视图网格排列"),
            ListData.SectionData(index: 4, title: "List", subTitle: "列表容器，显示一列数据(UITabbleView)"),
            ListData.SectionData(index: 5, title: "ScrollView", subTitle: "滚动视图 (UIScrollView)"),
            ListData.SectionData(index: 6, title: "ForEach", subTitle: "用已知数据，循环创建一组基础视图"),
            ListData.SectionData(index: 7, title: "Group", subTitle: "分组视图，可以给表现一样view分组，统一设置属性"),
            ListData.SectionData(index: 8, title: "From", subTitle: "表单视图，以竖向排列的形式显示"),
            ListData.SectionData(index: 9, title: "Size", subTitle: "获取一个视图的宽高"),
        ]),
        
        ListData(sectionIndex: 3, sectionText: "页面跳转", sectionData: [
            ListData.SectionData(index: 0, title: "NavigationLink", subTitle: "通过导航push跳转"),
            ListData.SectionData(index: 1, title: "Presented", subTitle: "弹出一个新页面Presented"),
            ListData.SectionData(index: 2, title: "Popover", subTitle: "pop出一个新视图"),
        ]),
        
        ListData(sectionIndex: 4, sectionText: "容器视图", sectionData: [
            ListData.SectionData(index: 0, title: "NavigationView", subTitle: "导航控制器(UINavigationController)"),
            ListData.SectionData(index: 1, title: "TabView", subTitle: "标签控制器(UITabBarController)"),
        ]),
        
        ListData(sectionIndex: 5, sectionText: "alert弹窗视图", sectionData: [
            ListData.SectionData(index: 0, title: "Alert", subTitle: "中心弹出，提醒对话框(UIAlertController)"),
            ListData.SectionData(index: 1, title: "Dialog", subTitle: "底部弹出，列表选择框(UIAlertControllerStyleActionSheet)"),
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
                                        FQTextView()
                                    case 1:
                                        FQTextFieldView()
                                    case 2:
                                        FQTextEditorView()
                                    case 3:
                                        FQButtonView()
                                    case 4:
                                        FQImageView()
                                    default:
                                        EmptyView()
                                    }
                                case 1:
                                    switch item.index {
                                    case 0:
                                        FQToggleView()
                                    case 1:
                                        FQStepperView()
                                    case 2:
                                        FQSliderView()
                                    case 3:
                                        FQPickerView()
                                    case 4:
                                        FQDatePickerView()
                                    default:
                                        EmptyView()
                                    }
                                case 2:
                                    switch item.index {
                                    case 0:
                                        FQVStackView()
                                    case 1:
                                        FQHStackView()
                                    case 2:
                                        FQZStackView()
                                    case 3:
                                        FQGridView()
                                    case 4:
                                        FQListView()
                                    case 5:
                                        FQScrollView()
                                    case 6:
                                        FQScrollView()
                                    case 7:
                                        FQGroupView()
                                    case 8:
                                        FQFromView()
                                    case 9:
                                        FQViewFrame()
                                    default:
                                        EmptyView()
                                    }
                                case 3:
                                    switch item.index {
                                    case 0:
                                        FQNavigationLinkView()
                                    case 1:
                                        FQPresentedView()
                                    case 2:
                                        FQPopoverView()
                                    default:
                                        EmptyView()
                                    }
                                case 4:
                                    switch item.index {
                                    case 0:
                                        FQNavigationView()
                                    case 1:
                                        FQTabView()
                                    default:
                                        EmptyView()
                                    }
                                case 5:
                                    switch item.index {
                                    case 0:
                                        FQAlertView()
                                    case 1:
                                        FQDialogView()
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
            }
            .navigationTitle("FQSwiftUI")
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
