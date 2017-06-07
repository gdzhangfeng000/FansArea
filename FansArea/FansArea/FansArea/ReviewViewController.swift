//
//  ReviewViewController.swift
//  FansArea
//
//  Created by 123 on 2017/6/7.
//  Copyright © 2017年 Zhang Feng. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    var rating: String?

    @IBOutlet weak var ratingStackView: UIStackView!
    @IBOutlet weak var bgImageView: UIImageView!
    
    //选择评价按钮
    @IBAction func ratingTap(_ sender: UIButton) {
        
        switch sender.tag {
        case 100:
            rating = "dislike"
        case 101:
            rating = "good"
        case 102:
            rating = "great"
        default:
            break
        }
        
        //判断后代码级别的转场  记住使用 performsegue
        performSegue(withIdentifier: "unwindToDetailView", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //可视化特效
        let effect = UIBlurEffect(style: .light)
        
        let  effectView = UIVisualEffectView(effect: effect)
        effectView.frame = view.frame
        bgImageView.addSubview(effectView)
        
        
    
        //动画起始位置 屏幕上500个点
        let startPos = CGAffineTransform(translationX: 0, y: 500)
        let startScale = CGAffineTransform(scaleX: 0, y: 0)
        
        ratingStackView.transform = startScale.concatenating(startPos)
    }
    //画面每次都显示 0.3秒从无到有
    override func viewDidAppear(_ animated: Bool) {
      
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            
            //退出的动画
            let endPos = CGAffineTransform(translationX: 0, y: 0)
            let endScale = CGAffineTransform.identity
            self.ratingStackView.transform = endPos.concatenating(endScale)
            
            self.ratingStackView.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
