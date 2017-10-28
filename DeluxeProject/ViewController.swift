/*
* Copyright (c) 2017 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

final class ViewController: UIViewController {
    
    fileprivate let button: DeluxeButton = {
        let btn = DeluxeButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.text = "Lemonade"
        btn.borderWidth = 10
        btn.imagePadding = 5
        btn.tintColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        btn.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        return btn
    }()
    
    @IBOutlet weak var btn: DeluxeButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            button.image = #imageLiteral(resourceName: "drink")
        
                btn.text = "Hello"
                btn.borderWidth = 20
                btn.imagePadding = 20
                btn.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
                btn.image = #imageLiteral(resourceName: "spaceship")
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor, constant : 300),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant : 20),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 150)
            ])
    }

    @IBAction func tapped(_ sender: Any) {
        print("tapped")
    }
}
