//  Copyright © 2016 Compass. All rights reserved.

import Foundation

public class Just<T>: Observable<T> {
    private let value: T

    public init(_ value: T) {
        self.value = value
        super.init()
    }

    public override func subscribe(_ handler: @escaping (Event<T>) -> Void) {
        handler(.next(value))
        handler(.done)
    }

    public override func subscribe(onNext: ((T) -> Void)? = nil, onError: ((Error) -> Void)? = nil, onDone: (() -> Void)? = nil) {
        onNext?(value)
        onDone?()
    }
}
