//
//  Extension.swift
//  iOSTesting
//
//  Created by Kyaw Kyaw Khing on 15/07/2021.
//

import Foundation
import UIKit

extension UIViewController{
    func showLoadingView(showLoading:Bool){
        if(showLoading){
            CustomLoadingView.shared().showActivityIndicator(uiView: self.view)
        }else{
            CustomLoadingView.shared().hideActivityIndicator(uiView: self.view)
        }
    }

    func showLoadingView(view:UIView,showLoading:Bool){
        if(showLoading){
            CustomLoadingView.shared().showActivityIndicator(uiView: view)
        }else{
            CustomLoadingView.shared().hideActivityIndicator(uiView: view)
        }
    }

}
