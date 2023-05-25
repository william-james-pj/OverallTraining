import Foundation

protocol DispatchQueueProtocol {
    func async(execute workItem: @escaping @convention(block) () -> Void)
}

extension DispatchQueue: DispatchQueueProtocol {
    func async(execute workItem: @escaping @convention(block) () -> Void) {
        async(group: nil, qos: .unspecified, flags: [], execute: workItem)
    }
}
