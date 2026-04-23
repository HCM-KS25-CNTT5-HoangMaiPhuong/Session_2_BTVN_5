CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    fullname VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);
CREATE TABLE wallets (
    wallet_id INT PRIMARY KEY,
    customer_id INT UNIQUE, 
    balance BIGINT NOT NULL CHECK (balance >= 0),
    
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE histories (
    history_id INT PRIMARY KEY,
    wallet_id INT NOT NULL,
    
    transfer_type ENUM('withdraw', 'deposit', 'payment') NOT NULL,
    amount BIGINT NOT NULL CHECK (amount > 0),
    
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (wallet_id) REFERENCES wallets(wallet_id)
);
