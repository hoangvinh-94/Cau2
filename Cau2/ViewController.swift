//
//  ViewController.swift
//  Cau2
//
//  Created by Cntt08 on 7/5/17.
//  Copyright © 2017 Cntt08. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textURL1: UITextField!
    @IBOutlet var textURL2: UITextField!
    
    @IBOutlet var image1: UIImageView!
    @IBOutlet var image2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textURL1.text = ""
        textURL2.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loadImage(_ sender: Any) {
        
        if(textURL1.text == "" && textURL2.text == ""){
            
        }
        else{
            let configuration =  URLSession(configuration: URLSessionConfiguration.default)
            if(textURL1.text != ""){
                let thread1 = DispatchQueue(label: "image1")
                 let url1: URL = URL(string: textURL1.text!)!
                thread1.async {
                    configuration.dataTask(with: url1, completionHandler: { (dataImage, response, error) in
                        if let data = dataImage {
                            DispatchQueue.main.async {
                                self.image1.image = UIImage(data: data)
                            }
                        }
                    }).resume()
                }


            }
            if(textURL2.text != ""){
                       let thread2 = DispatchQueue(label: "image2")
            
           
           
            let url2: URL = URL(string: textURL2.text!)!
            
            
            
            thread2.async {
                configuration.dataTask(with: url2, completionHandler:{ (dataImage, response, error) in
                    if let data = dataImage {
                        DispatchQueue.main.async {
                            self.image2.image = UIImage(data: data)
                        }
                    }
                }).resume()
            }
            }
            
        }
    }
    

}

