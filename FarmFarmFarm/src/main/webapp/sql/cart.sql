drop table CART cascade constraints purge;
create table cart(
    cart_id number primary key,
    cart_mem_id references mem(mem_id),
    cart_item_id references item(item_id),
    cart_quantity number(2)
);

drop sequence cart_seq;

create sequence cart_seq;

select * from cart where cart_mem_id = ?

insert into cart
values(cart_seq.nextval, ?, ?, ?);

delete from cart where cart_id = ?;

update cart 
set cart_quantity = ? 
where cart_id = ?

select c.cart_id, c.cart_mem_id, c.cart_item_id, c.cart_quantity, i.ITEM_NAME, i.ITEM_PRICE, i.ITEM_FILE1 
from cart c left outer join item i 
on c.cart_item_id = i.ITEM_ID 
where cart_mem_id = ? 