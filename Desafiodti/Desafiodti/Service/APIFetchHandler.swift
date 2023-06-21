//
//  APIFetchHandler.swift
//  Desafiodti
//
//  Created by Carol Bezerra on 21/06/23.
//

import Foundation
import Alamofire

class APIFetchHandler {

    static let sharedInstance = APIFetchHandler()

    func fetchAPIData() {
        let url = "http://localhost:3001/posts";

        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response { resp in
                switch resp.result{
                case .success(let data):
                    do{
                        let jsonData = try JSONDecoder().decode([PostMock].self, from: data!)
                        print(jsonData)
                    } catch {
                        print(error.localizedDescription)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }

    func postAPIData() {
        let url = "http://localhost:3001/posts";
        let params: Parameters = [
            "date": "26/01/2023",
            "title": "Put your records on",
            "details": "Música da Corinne Bailey Rae"
        ]

        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                        print("Error converting data to JSON object")
                        return
                    }
                    guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                        print("Error converting JSON object to Pretty JSON data")
                        return
                    }
                    guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                        print("Error converting JSON data in String")
                        return
                    }

                    print(prettyPrintedJson)
                } catch {
                    print("Error: Trying to convert JSON data to string")
                    return
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct PostMock: Codable {
    let date: String
    let title: String
    let details: String
}
