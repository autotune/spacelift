resource "aws_servicecatalog_portfolio" "portfolio" {
  name          = "My App Portfolio"
  description   = "List of my organizations apps"
  provider_name = "Brett"
}

resource "aws_servicecatalog_portfolio_share" "example" {
  principal_id = "705080791683"
  portfolio_id = aws_servicecatalog_portfolio.portfolio.id
  type         = "ACCOUNT"
}

data "aws_servicecatalog_portfolio_share" "example" {
      portfolio_id = aws_servicecatalog_portfolio_share.example.id
      type = "ACCOUNT"
}

output "shares" {
  value = data.aws_servicecatalog_portfolio_share.example
}
