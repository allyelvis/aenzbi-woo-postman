Creating and posting various types of data (such as invoice, billing, order, inventory, company info, user, stock movement, and stock transactions) to an external endpoint using Postman involves multiple steps. Each data type will have its own cURL command, which can be imported into Postman. Below, I'll provide example cURL commands for each type and how to import them into Postman.

### Example cURL Commands

#### 1. Posting an Invoice

```sh
curl -X POST https://aenzbi.bi/wp/wp-json/wc/v3/invoices \
-u consumer_key:consumer_secret \
-H "Content-Type: application/json" \
-d '{
  "order_id": 123,
  "invoice_number": "INV-001",
  "billing": {
    "first_name": "John",
    "last_name": "Doe",
    "address_1": "123 Main St",
    "city": "Anytown",
    "state": "CA",
    "postcode": "12345",
    "country": "US"
  },
  "line_items": [
    {
      "product_id": 56,
      "quantity": 1,
      "price": "21.99"
    }
  ]
}'
```

#### 2. Posting a Billing Order

```sh
curl -X POST https://aenzbi.bi/wp/wp-json/wc/v3/orders \
-u consumer_key:consumer_secret \
-H "Content-Type: application/json" \
-d '{
  "billing": {
    "first_name": "John",
    "last_name": "Doe",
    "address_1": "123 Main St",
    "city": "Anytown",
    "state": "CA",
    "postcode": "12345",
    "country": "US"
  },
  "line_items": [
    {
      "product_id": 56,
      "quantity": 1
    }
  ]
}'
```

#### 3. Posting Inventory Information

```sh
curl -X POST https://aenzbi.bi/wp/wp-json/wc/v3/products \
-u consumer_key:consumer_secret \
-H "Content-Type: application/json" \
-d '{
  "name": "Product Name",
  "type": "simple",
  "regular_price": "29.99",
  "description": "Product Description",
  "short_description": "Short Description",
  "categories": [
    {
      "id": 9
    }
  ],
  "stock_quantity": 100
}'
```

#### 4. Posting Company Information

```sh
curl -X POST https://aenzbi.bi/wp/wp-json/wc/v3/customers \
-u consumer_key:consumer_secret \
-H "Content-Type: application/json" \
-d '{
  "email": "company@example.com",
  "first_name": "Company",
  "last_name": "Name",
  "billing": {
    "company": "Company Name",
    "address_1": "123 Company St",
    "city": "Business City",
    "state": "BC",
    "postcode": "67890",
    "country": "US"
  }
}'
```

#### 5. Posting User Information

```sh
curl -X POST https://aenzbi.bi/wp/wp-json/wc/v3/customers \
-u consumer_key:consumer_secret \
-H "Content-Type: application/json" \
-d '{
  "email": "user@example.com",
  "first_name": "User",
  "last_name": "Name",
  "username": "username",
  "billing": {
    "first_name": "User",
    "last_name": "Name",
    "address_1": "123 User St",
    "city": "User City",
    "state": "UC",
    "postcode": "12345",
    "country": "US"
  },
  "password": "password"
}'
```

#### 6. Posting Stock Movement

```sh
curl -X POST https://aenzbi.bi/wp/wp-json/wc/v3/stock_movements \
-u consumer_key:consumer_secret \
-H "Content-Type: application/json" \
-d '{
  "product_id": 56,
  "quantity": 10,
  "movement_type": "addition",
  "note": "Stock replenishment"
}'
```

#### 7. Posting Different Stock Transactions

```sh
curl -X POST https://aenzbi.bi/wp/wp-json/wc/v3/stock_movements \
-u consumer_key:consumer_secret \
-H "Content-Type: application/json" \
-d '{
  "product_id": 56,
  "quantity": 5,
  "movement_type": "subtraction",
  "note": "Stock sold"
}'
```

### Import cURL Commands into Postman

1. **Open Postman**.
2. **Click on the Import button** in the top left corner.
3. **Select the Raw text option**.
4. **Paste the cURL command** into the text area.
5. **Click on Continue and then Import**.

### Configure Each Request in Postman

1. **Method**: Ensure the method is correct (e.g., `POST`).
2. **URL**: Verify the URL (`https://aenzbi.bi/wp/wp-json/wc/v3/...`).
3. **Authorization**:
   - Set the type to `Basic Auth`.
   - Enter your `consumer_key` as the username.
   - Enter your `consumer_secret` as the password.
4. **Headers**:
   - Ensure `Content-Type` is set to `application/json`.
5. **Body**:
   - Set the body type to `raw`.
   - Ensure the data is in JSON format as shown in the respective cURL command.

### Execute the Requests

Click the **Send** button in Postman to execute each request. If everything is set up correctly, you should see responses indicating the success of each operation.

By following these steps, you can efficiently post various types of data to the WooCommerce API using Postman. Adjust the JSON payloads as needed to match your specific requirements.
