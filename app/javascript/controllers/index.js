// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import CreateLoanController from "./create_loan_controller"
application.register("create-loan", CreateLoanController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import SearchLoansController from "./search_loans_controller"
application.register("search-loans", SearchLoansController)

import LoanApprovalController from "./loan_approval_controller"
application.register("loan-approval", LoanApprovalController)
