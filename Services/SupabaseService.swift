import Foundation

struct SupabaseService {
    let projectURL: URL?
    let anonKey: String

    init(
        projectURL: URL? = AppConfig.supabaseURL,
        anonKey: String = AppConfig.supabaseAnonKey
    ) {
        self.projectURL = projectURL
        self.anonKey = anonKey
    }

    var isConfigured: Bool {
        projectURL != nil && !anonKey.isEmpty
    }
}
