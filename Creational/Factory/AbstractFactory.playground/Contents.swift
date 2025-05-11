/*
    Author: Akash Sen
    Abstract Factory Design Pattern
    (Original standard)
*/

import Foundation

// MARK: Product Interface
protocol PaymentGateway {
    func pay()
}

protocol Invoice {
    func printInvoice()
}

// MARK: Concrete Products
final class PayPalPaymentGateway: PaymentGateway {
    func pay() {
        print("Pay using Paypal")
    }
}

final class StripePaymentGateway: PaymentGateway {
    func pay() {
        print("Pay using Stripe")
    }
}

final class IndianTaxInvoice: Invoice {
    func printInvoice() {
        print("Print Indian Tax Invoice")
    }
}

final class USTaxInvoice: Invoice {
    func printInvoice() {
        print("Print US Tax Invoice")
    }
}

// MARK: Creator Interface
protocol PaymentGatewayFactory {
    func createPaymentGateway() -> PaymentGateway
}

protocol InvoiceFactory {
    func createInvoice() -> Invoice
}

// MARK: Concrete Creators
final class PayPalPaymentGatewayFactory: PaymentGatewayFactory {
    func createPaymentGateway() -> PaymentGateway {
        return PayPalPaymentGateway()
    }
}

final class StripePaymentGatewayFactory: PaymentGatewayFactory {
    func createPaymentGateway() -> PaymentGateway {
        return StripePaymentGateway()
    }
}

final class IndianTaxInvoiceFactory: InvoiceFactory {
    func createInvoice() -> Invoice {
        return IndianTaxInvoice()
    }
}

final class USTaxInvoiceFactory: InvoiceFactory {
    func createInvoice() -> Invoice {
        return USTaxInvoice()
    }
}

// MARK: Initialization
protocol PaymentClient {
    var paymentGatewayFactory: PaymentGatewayFactory { get set }
    var invoiceFactory: InvoiceFactory { get set }
}

class Client: PaymentClient {
    var paymentGatewayFactory: PaymentGatewayFactory
    var invoiceFactory: InvoiceFactory
    
    init(paymentGatewayFactory: PaymentGatewayFactory, invoiceFactory: InvoiceFactory) {
        self.paymentGatewayFactory = paymentGatewayFactory
        self.invoiceFactory = invoiceFactory
    }
    
    func getPaymentGateway() -> PaymentGateway {
        return paymentGatewayFactory.createPaymentGateway()
    }
    
    func getInvoice() -> Invoice {
        return invoiceFactory.createInvoice()
    }
}

let client = Client(
    paymentGatewayFactory: PayPalPaymentGatewayFactory(),
    invoiceFactory: IndianTaxInvoiceFactory()
)
client.getPaymentGateway().pay()
client.getInvoice().printInvoice()
