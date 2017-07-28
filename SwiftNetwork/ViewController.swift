//
//  ViewController.swift
//  SwiftNetwork
//
//  Created by Codebender on 28/07/2017.
//  Copyright © 2017 A23 Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var imageView: UIImageView!
	@IBOutlet var imageLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		//set the image URL
		let imageUrl = URL(string: "https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb")!

		//create a URL Session, this time a shared one since its a simple app
		let session = URLSession.shared

		//then create a URL data task since we are getting simple data
		let task = session.dataTask(with:imageUrl) { (data, response, error) in

			if error == nil {

				//incase of success, get the data and pass it to the UIImage class
				let downloadedImage = UIImage(data: data!)

				//then we run the UI updating on the main thread.
				DispatchQueue.main.async {
					self.imageView.image = downloadedImage

				}





				//then we run the UI update on the main thread
				//performSelector(onMainThread:#selector(showImage), with: nil, waitUntilDone: false)
			}
		}

		//then start the task or resume it
		task.resume()


	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

