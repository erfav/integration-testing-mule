import * from bat::BDD
import * from bat::Assertions

// Install BAT and run this test file , see more: https://docs.mulesoft.com/api-functional-monitoring/bat-execute-task
// run the command from this folder bat OR bat ./checkin-test-suite.dwl
---
describe `Happy Path CheckIn` in [
  PUT `https://checkin-api-acm2510.us-e2.cloudhub.io/api/v1/tickets/PNR0000/checkin` with {
      headers: {
        "Content-Type" : "application/json"
      }
      , body: {
        "lastName": "Newton",
        "numBags": 3
      }
    } assert [
      $.response.status mustEqual 200,
      $.response.body.paymentID mustEqual "PAY-1AKD7482FAB9STATKO"
    ] execute [
      log($.response) // <--- Then we’ll log the response
    ]
]
