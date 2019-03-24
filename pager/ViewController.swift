//
//  ViewController.swift
//  pager
//
//  Created by DaliaDiab on 3/21/19.
//  Copyright © 2019 DaliaDiab. All rights reserved.
//

import UIKit
import FSPagerView
import Floaty

class ViewController: UIViewController , FSPagerViewDelegate , FSPagerViewDataSource {
    let floaty = Floaty()
     let item = FloatyItem()
    var btn = UIButton(type: .custom)

  
    var numberOfItems = 7
   let imageNames = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg"]
    let transformerTypes: [FSPagerViewTransformerType] = [.crossFading,
                                                          .zoomOut,
                                                          .depth,
                                                          .linear,
                                                          .overlap,
                                                          .ferrisWheel,
                                                          .invertedFerrisWheel,
                                                          .coverFlow,
                                                          .cubic]

    @IBOutlet weak var pagerView: FSPagerView!{
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            pagerView.transformer = FSPagerViewTransformer(type: .overlap)
        }
    }

    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return numberOfItems
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.clipsToBounds = true
        cell.textLabel?.text = index.description+index.description
        return cell
    }
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
   
    
 
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutFAB()
        


        
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func layoutFAB() {
        let item = FloatyItem()
        item.hasShadow = false

        item.buttonColor = UIColor.blue
        item.circleShadowColor = UIColor.red
        item.titleShadowColor = UIColor.blue
    
        
        
        
        item.handler = { item in

        }
      floaty.hasShadow = false
      
        floaty.addItem("اضافة مزايدة", icon: UIImage(named: "addbid") , titlePosition: .right)
        floaty.addItem("اضافة لوحة", icon: UIImage(named: "addproduct"), titlePosition: .right)
        { item in
            let alert = UIAlertController(title: "Hey", message: "I'm hungry...", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Me too", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        floaty.addItem(item: item)
       floaty.paddingX = ( self.view.frame.width/2 ) - ( floaty.frame.width/2 - 150)
//        floaty.fabDelegate = self as! FloatyDelegate

        self.view.addSubview(floaty)

    }


}

