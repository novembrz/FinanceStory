//
//  MenuViewController.swift
//  FinanceStory
//
//  Created by Дарья on 07.11.2020.
//

import UIKit
import Charts

enum Actions: String, CaseIterable{
    case revenue = "Доходы"
    case expenses = "Расходы"
    case myGoal = "Мои цели"
    case favourite = "Избранное"
    case settings = "Настройки"
}

class MenuViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet weak var currentBalanceLabel: UILabel!
    @IBOutlet weak var expensesLabel: UILabel!
    
    
    let actions = Actions.allCases
    var closure: ((IndexPath) -> ())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPieChart()
        
        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: "menuCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}


//MARK: Delegate & DataSource

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actions.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCell
        
        let action = actions[indexPath.row].rawValue
        
        cell.menuLabel.text = action
        cell.menuImageView.image = UIImage(named: action)
        cell.backgroundColor = .purple
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let action = actions[indexPath.row]
        
        switch action {
        case .revenue:
            print("revenue")
        case .expenses:
            print("expenses")
        case .myGoal:
            print("myGoal")
        case .favourite:
            print("favourite")
        case .settings:
            print("settings")
        }
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        let coursesVC = segue.destination as? CoursesViewController
//        let imageVC = segue.destination as? ImageViewController
//
//        switch segue.identifier {
//        case "OurCourses":
//            coursesVC?.fetchData()
//        case "OurCoursesWithAlamofire":
//            coursesVC?.fetchDataWithAlamofire()
//        case "ShowImage":
//            imageVC?.fetchImage()
//        case "ResponseData":
//            imageVC?.fetchDataWithAlamofire()
//        case "LargeImage":
//            imageVC?.downloadImageWithProgress()
//        default:
//            break
//        }
    }
}


//MARK: Setup PieChart

extension MenuViewController {
    
    func setupPieChart() {
        pieChart.chartDescription?.enabled = false
        pieChart.drawHoleEnabled = false
        pieChart.rotationAngle = 0
        //pieView.rotationEnabled = false
        pieChart.isUserInteractionEnabled = false
        
        //pieView.legend.enabled = false
        
        var entries: [PieChartDataEntry] = Array()
        entries.append(PieChartDataEntry(value: 50.0, label: "Takeout"))
        entries.append(PieChartDataEntry(value: 30.0, label: "Healthy Food"))
        entries.append(PieChartDataEntry(value: 20.0, label: "Soft Drink"))
        entries.append(PieChartDataEntry(value: 10.0, label: "Water"))
        entries.append(PieChartDataEntry(value: 40.0, label: "Home Meals"))
        
        let dataSet = PieChartDataSet(entries: entries, label: "")
        
        let c1 = NSUIColor(hex: 0x3A015C)
        let c2 = NSUIColor(hex: 0x4F0147)
        let c3 = NSUIColor(hex: 0x35012C)
        let c4 = NSUIColor(hex: 0x290025)
        let c5 = NSUIColor(hex: 0x11001C)
    
        dataSet.colors = [c1, c2, c3, c4, c5]
        dataSet.drawValuesEnabled = false
        
        pieChart.data = PieChartData(dataSet: dataSet)
    }
}


//MARK: Compositional Layout

extension MenuViewController {
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            
            let bigItemSize = NSCollectionLayoutSize(widthDimension: .fractionalHeight(1.0), heightDimension: .fractionalHeight(1.0))
            let bigItem = NSCollectionLayoutItem(layoutSize: bigItemSize)
            bigItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 20)
            
            let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
            smallItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 20)
            
            
            let leadingGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalHeight(0.5), heightDimension: .fractionalHeight(1.0))
            let leadingGroup = NSCollectionLayoutGroup.vertical(layoutSize: leadingGroupSize, subitem: smallItem, count: 2)
            
            
            let containerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let containerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: containerGroupSize, subitems: [leadingGroup, bigItem])

            
            let section = NSCollectionLayoutSection(group: containerGroup)
            section.orthogonalScrollingBehavior = .continuous
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 0)
            
            return section
        }
        return layout
    }
}
