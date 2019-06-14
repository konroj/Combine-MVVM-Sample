import SwiftUI
import Combine

enum RequestError: Error {
    case request(code: Int, error: Error?)
    case unknown
}

extension URLSession {
    
    func send(_ token: API) -> AnyPublisher<Data, RequestError>  {
        guard let url = URL(string: token.baseUrl + token.path) else { fatalError() }
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
        return send(request: request)
    }
    
    private func send(request: URLRequest) -> AnyPublisher<Data, RequestError> {
        AnyPublisher { subscriber in
            let task = self.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    let httpReponse = response as? HTTPURLResponse
                    if let data = data,
                       let httpReponse = httpReponse,
                       200..<300 ~= httpReponse.statusCode {
                        _ = subscriber.receive(data)
                        subscriber.receive(completion: .finished)
                    }
                    else if let httpReponse = httpReponse {
                        subscriber.receive(completion: .failure(.request(code: httpReponse.statusCode, error: error)))
                    }
                    else {
                        subscriber.receive(completion: .failure(.unknown))
                    }
                }
            }
            
            subscriber.receive(subscription: AnySubscription(task.cancel))
            task.resume()
        }
    }
    
}

extension JSONDecoder: TopLevelDecoder {}
