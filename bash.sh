curl -X POST https://aenzbi.bi/wp/wp-json/wc/v3/products \
-u consumer_key:consumer_secret \
-H "Content-Type: application/json" \
-d '{
  "name": "Premium Quality",
  "type": "simple",
  "regular_price": "21.99",
  "description": "Pellentesque habitant morbi tristique senectus et netus.",
  "short_description": "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
  "categories": [
    {
      "id": 9
    },
    {
      "id": 14
    }
  ]
}'
