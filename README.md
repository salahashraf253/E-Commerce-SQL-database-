# E-commerce Database

## Overview

This database is designed to support an e-commerce platform, managing various entities such as buyers, sellers, categories, products, cart items, orders, and product reviews. The inclusion of a language table facilitates multi-language support for translations.

## Entity Relationship Diagram (ERD)

![ERD](https://github.com/salahashraf253/E-Commerce-SQL-database-/blob/main/erd.png)

## Tables

### 1. Buyer

- `id` (Primary Key): Unique identifier for each buyer.
- `name`: Full name of the buyer.
- `email` (Unique): Email address of the buyer.
- `password`: Password for buyer authentication.
- `address`: Buyer's address.

### 2. Seller

- `id` (Primary Key): Unique identifier for each seller.
- `name`: Full name of the seller.
- `email` (Unique): Email address of the seller.
- `password`: Password for seller authentication.
- `address`: Seller's address.
- `store_name`: Name of the seller's store.

### 3. Language

- `id` (Primary Key): Unique identifier for each language.
- `code` (Unique): Language code (e.g., 'en' for English).

### 4. Category

- `id` (Primary Key): Unique identifier for each category.

### 5. Category Translation

- `id` (Primary Key): Unique identifier for each category translation.
- `language_id` (Foreign Key): Reference to the associated language.
- `name`: Translated name of the category.
- `category_id` (Foreign Key): Reference to the associated category.
  
  **Relationships:**
  - Many-to-One: Many category translations can belong to one category.
  - Many-to-One: Many category translations can be in one language.

### 6. Product

- `id` (Primary Key): Unique identifier for each product.
- `category_id` (Foreign Key): Reference to the associated category.
- `price`: Price of the product.
- `quantity`: Available quantity of the product.
- `seller_id` (Foreign Key): Reference to the associated seller.

  **Relationships:**
  - Many-to-One: Many products can belong to one category.
  - Many-to-One: Many products can be associated with one seller.

### 7. Product Translation

- `id` (Primary Key): Unique identifier for each product translation.
- `product_id` (Foreign Key): Reference to the associated product.
- `language_id` (Foreign Key): Reference to the associated language.
- `name`: Translated name of the product.
- `description`: Translated description of the product.

  **Relationships:**
  - Many-to-One: Many product translations can belong to one product.
  - Many-to-One: Many product translations can be in one language.

### 8. Cart

- `id` (Primary Key): Unique identifier for each item in the cart.
- `buyer_id` (Foreign Key): Reference to the associated buyer.
- `product_id` (Foreign Key): Reference to the associated product.
- `product_price`: Price of the product in the cart.
- `product_quantity`: Quantity of the product in the cart.

  **Relationships:**
  - Many-to-One: Many cart items can belong to one buyer.
  - Many-to-One: Many cart items can be associated with one product.

### 9. Orders

- `id` (Primary Key): Unique identifier for each order.
- `buyer_id` (Foreign Key): Reference to the associated buyer.

  **Relationships:**
  - Many-to-One: Many orders can belong to one buyer.

### 10. Order Products

- `id` (Primary Key): Unique identifier for each item in an order.
- `product_id` (Foreign Key): Reference to the associated product.
- `order_id` (Foreign Key): Reference to the associated order.
- `product_price`: Price of the product in the order.
- `product_quantity`: Quantity of the product in the order.

  **Relationships:**
  - Many-to-One: Many order products can belong to one order.
  - Many-to-One: Many order products can be associated with one product.

### 11. Review

- `id` (Primary Key): Unique identifier for each review.
- `buyer_id` (Foreign Key): Reference to the associated buyer.
- `product_id` (Foreign Key): Reference to the associated product.
- `rating`: Numeric rating given by the buyer.
- `comment`: Optional comment provided by the buyer.

  **Relationships:**
  - Many-to-One: Many reviews can belong to one buyer.
  - Many-to-One: Many reviews can be associated with one product.

