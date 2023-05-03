INSERT INTO cards (user_id, card_type, number)
VALUES (10, 'Visa', '1111222233334444'),
       (11, 'MasterCard', '5555666677778888'),
       (12, 'American Express', '9999000011112222'),
       (10, 'MasterCard', '1234123412341234');
	   
-- Insertar pedido para admin
INSERT INTO orders (user_id, total_price) VALUES (10, 59.85);

-- Insertar pedido para aaron
INSERT INTO orders (user_id, total_price) VALUES (11, 48.85);

-- Insertar pedido para roi
INSERT INTO orders (user_id, total_price) VALUES (12, 58.80);


