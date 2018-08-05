//
//  ViewController.swift
//  JsonDecodable
//
//  Created by Victor Lee on 5/8/18.
//  Copyright © 2018 VictorLee. All rights reserved.
//

import UIKit

class PortfolioController: UITableViewController {

    var portfolios = [Portfolios]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.blue
        navigationItem.title = "MY PORTFOLIOS"
        fetchJSON()
    }

    fileprivate func fetchJSON(){
        let urlString = "https://demo9414363.mockable.io/portfolioSwift"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Failed to fetch data from url", error)
                    return
                }
                guard let data = data else { return }
                do {
                    let decoder = JSONDecoder()
                    // Swift 4.1
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    self.portfolios = try decoder.decode([Portfolios].self, from: data)
                    
                    self.tableView.reloadData()
                    
                } catch let jsonError {
                    print("Failed to decode json", jsonError)
                }

            }
        }.resume()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return portfolios.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellId")
        let portfolio = portfolios[indexPath.row]
        cell.textLabel?.text = portfolio.type
        cell.detailTextLabel?.text = String(portfolio.expReturns * 100)+"%"
        print("Portfolio type:\(portfolio.type)")
        return cell
    }
    
    

    

}

