
import Foundation

public func openImage(image path: String) throws -> UnsafePointer<mach_header>? {
    
    let index = (0..<_dyld_image_count())
        .filter {
            String(cString: _dyld_get_image_name($0))
                .contains(path)
        }
        .first
    
    if let index {
        return _dyld_get_image_header(index)
    } else {
        return nil
    }
}