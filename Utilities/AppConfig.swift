import Foundation

enum AppConfig {
    static var supabaseURL: URL? {
        guard let value = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_URL") as? String,
              !value.isEmpty else {
            return nil
        }

        return URL(string: value)
    }

    static var supabaseAnonKey: String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: "SUPABASE_ANON_KEY") as? String else {
            return ""
        }

        return value
    }
}