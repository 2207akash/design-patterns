/*
    Author: Akash Sen
    Factory Design Pattern
    (Original standard)
*/

import Foundation

// MARK: Product Interface
protocol PaymentGateway {
    func pay()
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

// MARK: Creator Interface
protocol PaymentGatewayFactory {
    func createPaymentGateway() -> PaymentGateway
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


// MARK: Initialization
class Client {
    private var paymentGatewayFactory: PaymentGatewayFactory
    
    init(paymentGatewayFactory: PaymentGatewayFactory) {
        self.paymentGatewayFactory = paymentGatewayFactory
    }
    
    func getPaymentGateway() -> PaymentGateway {
        return paymentGatewayFactory.createPaymentGateway()
    }
}

let client = Client(paymentGatewayFactory: PayPalPaymentGatewayFactory())
let paymentGateway = client.getPaymentGateway()
paymentGateway.pay()
