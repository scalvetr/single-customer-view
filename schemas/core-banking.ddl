CREATE TABLE IF NOT EXISTS accounts
(
    account_id        SERIAL         NOT NULL PRIMARY KEY,
    customer_id       VARCHAR(50)    NOT NULL,
    iban              VARCHAR(35)    NOT NULL,
    balance           DECIMAL(20, 3) NOT NULL,
    creation_date     TIMESTAMP(3)      NOT NULL,
    cancellation_date TIMESTAMP(3),
    status            VARCHAR(10)    NOT NULL
);
CREATE TABLE IF NOT EXISTS bookings
(
    booking_id   SERIAL         NOT NULL PRIMARY KEY,
    account_id   INTEGER        NOT NULL,
    amount       DECIMAL(20, 3) NOT NULL,
    description  VARCHAR(250)   NOT NULL,
    booking_date TIMESTAMP(3)      NOT NULL,
    value_date   TIMESTAMP(3),
    fee          DECIMAL(20, 3) NOT NULL DEFAULT 0,
    taxes        DECIMAL(20, 3) NOT NULL DEFAULT 0,
    CONSTRAINT fk_account
        FOREIGN KEY (account_id)
            REFERENCES accounts (account_id)
);