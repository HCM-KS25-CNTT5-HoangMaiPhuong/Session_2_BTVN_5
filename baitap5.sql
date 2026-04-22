create table if not exists customers (
	customer_id int primary key,
    fullname varchar(100) not null,
    email varchar(255) not null unique,
    wallet_id int not null,
    foreign key (wallet_id) references wallets (wallet_id)
);
create table if not exists wallets (
	wallet_id int primary key,
    balance bigint not null check (balance >= 0)
);

create table if not exists histories (
	history_id int primary key,
    wallet_id int not null,
    foreign key (wallet_id) references wallets (wallet_id),
    tranfer_type enum('withdraw', 'deposit', 'payment') not null,
    amount bigint not null check (amount > 0),
    status varchar(20) not null default 'pending',
    created_at timestamp default current_timestamp
    );