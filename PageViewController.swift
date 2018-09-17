//
//  PageViewController.swift
//  Weather app
//
//  Created by Filip  Gonera on 09/09/2018.
//  Copyright © 2018 Filip  Gonera. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    
    
    var pageControl = UIPageControl()
    
    lazy var subViewControllers : [UIViewController] = {
        return [
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CurrentWeatherViewController") as! CurrentWeatherViewController,
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForecastWeatherViewController") as! ForecastWeatherViewController
        ]
    }()
    
    

    override func viewDidLoad() {
        self.delegate = self
        self.dataSource = self
        super.viewDidLoad()
        configurePageControl()
        setViewControllers([subViewControllers[0]], direction: .forward, animated: true, completion: nil)
        self.view.backgroundColor = UIColor.white //I set background color of page controller to match ViewControllers backgrounds
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex: Int = subViewControllers.index(of: viewController) ?? 0
        if(currentIndex <= 0) {
            return nil
        }
        return subViewControllers[currentIndex-1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex: Int = subViewControllers.index(of: viewController) ?? 0
        if(currentIndex >= subViewControllers.count-1) {
            return nil
        }
        return subViewControllers[currentIndex+1]
    }
    
    func configurePageControl(){ //Here i configure indicator dots on the bottom of the screen
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = subViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.gray
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = subViewControllers.index(of: pageContentViewController)!
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
