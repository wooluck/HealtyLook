//
//  GetWeatherDataService.swift
//  HealthyLook
//
//  Created by luck woo on 2022/10/27.
//

import Foundation
import Alamofire

struct GetWeatherDataService {
    static let shared = GetWeatherDataService()
    
    func getWeatherInfo(completion: @escaping (NetworkResult<Any>) -> Void) {
        let URL = "https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=a82bee99cbdb882265172f920605a6a2"
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = AF.request(URL,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
                let networkResult = self
                
            case .failure: completion(.pathErr)
            }
        }
    }
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        
        switch statusCode {
        case 200: return isValidData(data: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(WeatherModel.self, from: data) else { return .pathErr }
        
        return .success(decodedData)
    }
    
}
