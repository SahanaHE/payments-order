/**
 * Ping Status Response of the backend System API's
 */
%dw 2.0
output application/java
---
[{
	"name" : vars.sysCheckHost,
	"status" : vars.backendSystemStatus
}]