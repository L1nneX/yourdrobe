import Foundation

struct SupabaseService {
    let projectURL: URL?
    let anonKey: String

    init(projectURL: URL? = nil, anonKey: String = "") {
        self.projectURL = projectURL
        self.anonKey = anonKey
    }
}
