Here's a `README.md` file to help you set up and use the Postman collection for posting various data types to an external endpoint for real-time fiscalization, using both Basic Auth and Bearer Token for authentication.

```markdown
# WooCommerce API Postman Collection for Fiscalization

This repository contains a Postman collection for posting various data types (invoice, billing order, inventory, company info, user, stock movement, and stock transactions) to an external endpoint for real-time fiscalization. The requests use both Basic Auth and Bearer Token for authentication.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Requests](#requests)
  - [Invoice](#invoice)
  - [Billing Order](#billing-order)
  - [Inventory Information](#inventory-information)
  - [Company Information](#company-information)
  - [User Information](#user-information)
  - [Stock Movement](#stock-movement)
  - [Stock Transactions](#stock-transactions)
- [Running the Collection](#running-the-collection)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

- [Postman](https://www.postman.com/downloads/) installed on your machine.
- WooCommerce API credentials (Consumer Key and Consumer Secret).
- External endpoint for fiscalization with Bearer Token for authentication.

## Setup

### 1. Import the Collection into Postman

1. Open Postman.
2. Click on the **Import** button in the top-left corner.
3. Select the exported collection file (`collection.json`).
4. Click **Import**.

### 2. Configure the Environment

1. Click on the gear icon in the top-right corner of Postman.
2. Click on **Add** to create a new environment.
3. Name the environment (e.g., "Fiscalization Endpoint").
4. Add the following variables:
   - `base_url`: The base URL of your external endpoint (e.g., `https://external-endpoint.com/api`).
   - `bearer_token`: Your Bearer Token for authentication.

### 3. Set Up Authorization Headers

1. Go to each request in the collection.
2. Under the **Headers** tab, add a new header:
   - **Key**: `Authorization`
   - **Value**: `Bearer {{bearer_token}}`

### 4. Use Environment Variables

1. Replace the URLs in your requests with environment variables, for example: `{{base_url}}/invoices`.

## Requests

### Invoice

**Method**: `POST`  
**URL**: `{{base_url}}/invoices`  
**Authorization**: Basic Auth  
**Headers**: `Content-Type: application/json`  
**Body** (raw, JSON):

```json
{
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
}
```

### Billing Order

**Method**: `POST`  
**URL**: `{{base_url}}/orders`  
**Authorization**: Basic Auth  
**Headers**: `Content-Type: application/json`  
**Body** (raw, JSON):

```json
{
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
}
```

### Inventory Information

**Method**: `POST`  
**URL**: `{{base_url}}/products`  
**Authorization**: Basic Auth  
**Headers**: `Content-Type: application/json`  
**Body** (raw, JSON):

```json
{
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
}
```

### Company Information

**Method**: `POST`  
**URL**: `{{base_url}}/customers`  
**Authorization**: Basic Auth  
**Headers**: `Content-Type: application/json`  
**Body** (raw, JSON):

```json
{
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
}
```

### User Information

**Method**: `POST`  
**URL**: `{{base_url}}/customers`  
**Authorization**: Basic Auth  
**Headers**: `Content-Type: application/json`  
**Body** (raw, JSON):

```json
{
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
}
```

### Stock Movement

**Method**: `POST`  
**URL**: `{{base_url}}/stock_movements`  
**Authorization**: Basic Auth  
**Headers**: `Content-Type: application/json`  
**Body** (raw, JSON):

```json
{
  "product_id": 56,
  "quantity": 10,
  "movement_type": "addition",
  "note": "Stock replenishment"
}
```

### Stock Transactions

**Method**: `POST`  
**URL**: `{{base_url}}/stock_movements`  
**Authorization**: Basic Auth  
**Headers**: `Content-Type: application/json`  
**Body** (raw, JSON):

```json
{
  "product_id": 56,
  "quantity": 5,
  "movement_type": "subtraction",
  "note": "Stock sold"
}
```

## Running the Collection

1. Open Postman.
2. Select the imported collection.
3. Click the **Run** button.
4. Ensure the environment is set to "Fiscalization Endpoint".
5. Click **Start Run**.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request with your improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```

This `README.md` file provides clear instructions for setting up and using the Postman collection, including how to configure the environment, set up authorization headers, and run the collection. Adjust the JSON payloads and URLs as necessary to match your specific requirements.
