/*
    Author: Akash Sen
    Simple Factory Design Pattern
    (Non standard)
*/

import Foundation

// MARK: Payment Gateway Types
enum PaymentGatewayType {
    case paypal, stripe
}

// MARK: Product Interface
protocol PaymentGateway {
    func pay()
}

// MARK: Concrete Products
final class PaypalPaymentGateway: PaymentGateway {
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
    func createPaymentGateway(type: PaymentGatewayType) -> PaymentGateway
}

// MARK: Concrete Creator
final class ConcretePaymentGatewayFactory: PaymentGatewayFactory {
    func createPaymentGateway(type: PaymentGatewayType) -> PaymentGateway {
        switch type {
        case .paypal:
            return PaypalPaymentGateway()
        case .stripe:
            return StripePaymentGateway()
        }
    }
}


// MARK: Initialization
class Client {
    private var paymentGatewayFactory: PaymentGatewayFactory
    
    init(paymentGatewayFactory: PaymentGatewayFactory) {
        self.paymentGatewayFactory = paymentGatewayFactory
    }
    
    func getPaymentGateway(type: PaymentGatewayType) -> PaymentGateway {
        return paymentGatewayFactory.createPaymentGateway(type: type)
    }
}

let client = Client(paymentGatewayFactory: ConcretePaymentGatewayFactory())
let paymentGateway = client.getPaymentGateway(type: .paypal)
paymentGateway.pay()
