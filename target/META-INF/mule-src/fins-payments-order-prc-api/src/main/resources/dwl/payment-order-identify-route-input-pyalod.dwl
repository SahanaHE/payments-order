%dw 2.0
output application/json
---
{
	Amount: ((vars.originalRouteRequest.PaymentOrderProcedure.Amount default "") replace /[^0-9,.]/ with "") as Number default 0,
	CreditorBank: vars.originalRouteRequest.PaymentOrderProcedure.PayeeBankReference.BankID,
	CreditorBankCountry: payload.destBankCountry,
	CreditorAccountType: vars.originalRouteRequest.PaymentOrderProcedure.PayeeReference.AccountType,
	CreditorAcountCurrency: vars.originalRouteRequest.PaymentOrderProcedure.CurrencyOfTransfer,
	DebtorBank: vars.originalRouteRequest.PaymentOrderProcedure.PayerBankReference.BankID,
	DebtorBankCountry: payload.srcBankCountry,
	DebtorAccountType: vars.originalRouteRequest.PaymentOrderProcedure.PayerReference.AccountType, 
	DebtorAcountCurrency: vars.originalRouteRequest.PaymentOrderProcedure.Currency,
	TransferType: vars."initialRequest".PaymentOrderProcedure.PaymentTransactionType,
	ChannelType: vars.originalRouteRequest.PaymentOrderProcedure.PaymentMechanismType,
	Stage: "CORE_PROCESS"
}