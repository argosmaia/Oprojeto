import Foundation
import TransactionDTO
import Report

protocol ReportServiceProtocol {
    func generateReport(transactions: [TransactionDTO]) -> Report
}