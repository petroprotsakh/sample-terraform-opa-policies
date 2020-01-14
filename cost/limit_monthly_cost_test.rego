package terraform

test_cost_allowed {
    result = deny with input as {"tfrun": {"cost_estimate": {"proposed_monthly_cost": 1.0}}}
    count(result) == 0
}

test_cost_denied {
    result = deny with input as {"tfrun": {"cost_estimate": {"proposed_monthly_cost": 7.0}}}
    count(result) > 0
}
