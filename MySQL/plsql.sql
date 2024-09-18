Delimiter $$
Create procedure faculty_detailsProcedure()
Begin
select *  from faculty_details;
End $$

drop procedure faculty_detailsProcedure;
Delimiter $$
Create procedure platinumCustomerList()
Begin
select customerName  as platinum from customer_table where creditlimit >9000 ;
End $$
Delimiter $$
Create procedure platinumCustomerList1()
Begin
select customerName as platinum from customer_table where customerNumber ='CUST004' and creditlimit >9000;
End $$

drop procedure Creditlimit;
Delimiter $$
Create procedure Creditlimit(In custid varchar(10),out customerLevel varchar(10))
Begin
declare Credit decimal(10,2) Default 0;
select creditlimit into Credit from customer_table where customernumber = custid;
if credit > 100000 Then
   set customerLevel = 'Platinum';
ElseIf credit < 100000 and credit > 5000 Then
   set customerLevel = 'Gold';
ElseIf credit > 0 and credit < 5000 Then
   set customerLevel = 'Normal';
   End if ;
End $$
call percentage(1,@level);
select @level;


Delimiter $$
Create procedure evenOdd(In num int,out result varchar(10))
Begin
if num%2 Then
   set result = 'Odd';
Else 
   set result = 'Even';
   End if ;
End $$

call evenodd(4,@result);
select @result;

DELIMITER $$
CREATE PROCEDURE even(IN num INT, OUT result VARCHAR(10))
BEGIN
    IF num BETWEEN 1 AND 10 THEN
        IF num % 2 = 0 THEN
            SET result = 'Even';
        ELSE
            SET result = 'Odd';
        END IF;
    ELSE
        SET result = 'Number out of range';
    END IF;
END $$
call even(5,@result);
select @result;

DELIMITER $$

CREATE PROCEDURE TrackItemChanges()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE old_price DECIMAL(10, 2);
    DECLARE old_name VARCHAR(100);
    DECLARE item_id INT;
    DECLARE cur CURSOR FOR SELECT id, price, name FROM items;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Open the cursor
    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO item_id, old_price, old_name;

        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Check if there's a difference in price
        IF old_price != (SELECT price FROM items WHERE id = item_id) THEN
            INSERT INTO item_changes (item_id, change_type) 
            VALUES (item_id, 'Price Update');
        END IF;

        -- Check if there's a difference in name
        IF old_name != (SELECT name FROM items WHERE id = item_id) THEN
            INSERT INTO item_changes (item_id, change_type) 
            VALUES (item_id, 'Name Update');
        END IF;

    END LOOP;

    -- Close the cursor
    CLOSE cur;
END$$
