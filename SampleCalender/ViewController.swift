//
//  ViewController.swift
//  SampleCalender
//
//  Created by Wasim Alatrash on 2/7/18.
//  Copyright © 2018 Wasim Alatrash. All rights reserved.
//

import UIKit
import JTAppleCalendar
import SnapKit

class ViewController : UIViewController, JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        //
    }
    
    
    var calendarView = JTAppleCalendarView()
    var collectionView : UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.6509803922, blue: 0.6156862745, alpha: 1)
        calendarView.backgroundColor = #colorLiteral(red: 0, green: 0.6509803922, blue: 0.6156862745, alpha: 1)
        collectionView?.backgroundColor = #colorLiteral(red: 0, green: 0.6509803922, blue: 0.6156862745, alpha: 1)

        setupCallendarView()
    }
    
    func setupCallendarView(){
        calendarView.scrollDirection = .horizontal
        
        calendarView.showsHorizontalScrollIndicator = false
        calendarView.showsVerticalScrollIndicator = false
        
        calendarView.delegate = self
        calendarView.dataSource = self
        calendarView.register(CalenderCell.self, forCellWithReuseIdentifier: "calendarCell")
        
        view.addSubview(calendarView)
        calendarView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15)
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview()
        }
    }
    
    
    let formatter = DateFormatter()
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        
        let startDate = formatter.date(from: "2017 01 01")!
        let endDate = formatter.date(from: "2018 02 01")!
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "calendarCell", for: indexPath) as! CalenderCell
        cell.titleLabel.text = cellState.text
        
        return cell
    }
    
}

class CalenderCell : JTAppleCell {
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLabel.textAlignment = .center
        backgroundColor = #colorLiteral(red: 0, green: 0.6509803922, blue: 0.6156862745, alpha: 1)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

