/**
 * Maps BIAN v10 Payment Order Request to BIAN v10 Payment Execution request.
 */
%dw 2.0
output application/json
---
/**
 * Maps BIAN v10 PaymentOrderProcedure Object Request to BIAN v10 Payment Execution Procedure Object.
 * @table BIAN PaymentExecutionProcedure,BIAN PaymentOrderProcedure,Description
 * @row PaymentTransactionInitiatorReference.ServicingSessionReference,PaymentTransactionInitiatorReference.ServicingSessionReference,Unique Id of the session
 * @row PaymentTransactionInitiatorReference.TransactionInstanceStatus,PaymentTransactionInitiatorReference.TransactionInstanceStatus,Status of the payment transaction instance
 * @row PaymentTransactionInitiatorReference.PaymentPurpose,PaymentTransactionInitiatorReference.PaymentPurpose,Purpose of the payment
 * @row PaymentTransactionInitiatorReference.UserID,PaymentTransactionInitiatorReference.UserID,User Id used for payment order transaction
 * @row PaymentTransactionType,PaymentTransactionType,Payment Transaction Type that is being ordered 
 * @row EndToEndIdentification,EndToEndIdentification,Unique Id for End to End Identification
 * @row PaymentMechanismType,PaymentMechanismType,Payment Mechanism to be used for payment
 * @row CurrencyOfTransfer,CurrencyOfTransfer,Currency to transfer
 * @row Amount,Amount,Amount of payment
 * @row Currency,Currency,Currency for the payment
 * @row PayerReference.CustomerID,PayerReference.CustomerID,Debtor Account Customer Id for payment
 * @row PayerReference.CustomerName,PayerReference.CustomerName,Debtor Account Name for payment
 * @row PayerReference.AccountType,PayerReference.AccountType,Debtor Account type for payment
 * @row PayerBankReference.BankID,PayerBankReference.BankID,Debtor Bank Id for payment
 * @row PayeeReference.CustomerID,PayeeReference.CustomerID,Creditor Account Customer Id for payment
 * @row PayeeReference.AccountType,PayeeReference.AccountType,Creditor Account type for payment
 * @row PayeeBankReference.BankID,PayeeBankReference.BankID,Creditor Bank Id for payment
 */
{
	PaymentExecutionProcedure: {
		PaymentTransactionInitiatorReference: {
			ServicingSessionReference: vars.originalRouteRequest.PaymentOrderProcedure.PaymentTransactionInitiatorReference.ServicingSessionReference,
			TransactionInstanceStatus: vars.originalRouteRequest.PaymentOrderProcedure.PaymentTransactionInitiatorReference.TransactionInstanceStatus,
			PaymentPurpose: vars.originalRouteRequest.PaymentOrderProcedure.PaymentTransactionInitiatorReference.PaymentPurpose,
			UserID: vars.originalRouteRequest.PaymentOrderProcedure.PaymentTransactionInitiatorReference.UserID
		},
		PaymentTransactionType: vars.originalRouteRequest.PaymentOrderProcedure.PaymentTransactionType,
		EndToEndIdentification: vars.originalRouteRequest.PaymentOrderProcedure.EndToEndIdentification,
		PaymentMechanismType: vars.originalRouteRequest.PaymentOrderProcedure.PaymentMechanismType,
		CurrencyOfTransfer: vars.originalRouteRequest.PaymentOrderProcedure.CurrencyOfTransfer ,
		Amount: vars.originalRouteRequest.PaymentOrderProcedure.Amount,
		Currency: vars.originalRouteRequest.PaymentOrderProcedure.Currency,
		DateType: now() as String {format: "y-MM-dd"},
		PayerReference:{
			CustomerID: vars.originalRouteRequest.PaymentOrderProcedure.PayerReference.CustomerID,
			CustomerName: vars.originalRouteRequest.PaymentOrderProcedure.PayerReference.CustomerName,
			AccountType: vars.originalRouteRequest.PaymentOrderProcedure.PayerReference.AccountType,
		},
		PayerBankReference:{
			BankID: vars.originalRouteRequest.PaymentOrderProcedure.PayerBankReference.BankID
		},			
		
		PayeeReference: {
			CustomerID: vars.originalRouteRequest.PaymentOrderProcedure.PayeeReference.CustomerID,
			AccountType: vars.originalRouteRequest.PaymentOrderProcedure.PayeeReference.AccountType
		},
		PayeeBankReference:{
			BankID: vars.originalRouteRequest.PaymentOrderProcedure.PayeeBankReference.BankID
		}
	}
}
