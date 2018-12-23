//
// Created by Yoshihiro Tanaka on 2018-12-22.
// Copyright (c) 2018 Yoshihiro Tanaka. All rights reserved.
//

import RxCocoa
import RxSwift
import Cleanse
import Alamofire

class MainRepository {
    private let client: APIClient

    init(client: APIClient) {
        self.client = client
    }

    func getRegions() -> Maybe<[Region]> {
        return Maybe.create { [unowned self] emitter -> Disposable in
            let request = self.client.getRegions()
            let disposable = Disposables.create {
                request.cancel()
            }
            request.response {
                if disposable.isDisposed {
                    return
                }
                guard let data = $0.data else {
                    emitter(.completed)
                    return
                }
                do {
                    let regions: [String: Region] = try JSONDecoder().decode([String: Region].self, from: data)
                    emitter(.success(regions.map { (_, region) in
                        region
                    }))
                } catch {
                    emitter(.error(error))
                }
            }
            return disposable
        }
    }

    struct Module: Cleanse.Module {
        static func configure(binder: SingletonBinder) {
            binder.bind().sharedInScope().to(factory: MainRepository.init)
        }
    }
}
