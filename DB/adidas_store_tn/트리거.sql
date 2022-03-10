/*주문할 때 주문수량 만큼 해당 제품의 수량을 빼준다.*/
delimiter //
create trigger insert_orderlist after insert on orderlist
for each row
begin
	update `option`
		set 
			op_amount = op_amount - new.ol_amount
		where 
			op_num = new.ol_op_num;
end //
delimiter ;

show triggers;