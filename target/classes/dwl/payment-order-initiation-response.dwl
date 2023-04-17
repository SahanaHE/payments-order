%dw 2.0
output application/json
---
{
  "PaymentOrderProcedure": {
    "PaymentMechanismType": vars.originalRouteRequest.PaymentOrderProcedure.PaymentMechanismType
  }
}