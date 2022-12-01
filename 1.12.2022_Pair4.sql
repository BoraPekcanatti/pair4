--1-Product ratinglere göre gruplama
select p.product_rating from products p
group by product_rating
--2-Product ratingleri aynı olan ürün sayısı
select p.product_rating, count(p.product_rating) from products p
group by p.product_rating
--3-Rengi Kırmızı olan ürünler
select p.name , c.color_name from products p
inner join product_colors pc
on p.id = pc.product_id
inner join colors c
on pc.color_id = c.id
group by color_name , p.name
having c.color_name = 'Kırmızı'
--4-Hangi renkten kaç adet ürün mevcut ?
select count(c.id) , c.color_name  from products p
inner join product_colors pc
on p.id = pc.product_id
inner join colors c
on pc.color_id = c.id
group by c.color_name 
order by count(c.id) desc
--5-Hangi ürünlerin iade edildiğinin sorgulanması
select p.name, rf.refund_reason from refunds rf
inner join refund_products as rfp
on rf.id = rfp.refund_id
inner join order_products as op
on op.id = rf.order_id
inner join products as p
on p.id = op.id
--6-İade edilen ürünlerin sayısı,iade sebebi ve kimin tarafından iade edildiği
select cs.name, cs.surname, rfp.quantity "İade Edilen Ürün Sayısı", rf.refund_reason "İade Sebebi" from refunds rf
inner join refund_products as rfp
on rf.id = rfp.refund_id
inner join orders as o
on o.id = rf.order_id
inner join customers as cs
on o.customer_id = cs.id
--7-Hangi Renkten kaç adet ürün satıldı
select co.color_name ,sum(op.quantity) as "Toplam sayi" from products p
inner join order_products op
on op.product_id = p.id
inner join product_colors pc
on p.id = pc.product_id
inner join colors co
on co.id = pc.color_id
group by co.color_name
order by sum(op.quantity)
--8-Kategorilerin Ortalama Fiyatı
select c.name as "Kategori İsmi", avg(unit_price) as "Ortalama Fiyatı" from products as p
inner join categories as c
on p.category_id = c.id
group by c.name, p.category_id
order by avg(unit_price) asc
--9-Sepetteki ürünlerin toplam fiyatı
select sum(total_cost) from baskets
--10-Sepetteki ürün sayısı
select count(id) from baskets
--11-Max takipçi sayısına sahip satıcı bulma
select name,follower_count from sellers
group by name , follower_count
order by follower_count desc
limit 1
--12-Fiyatı Belirli Aralıktaki Ürünlerin Sıralanması
select p.name,p.unit_price from products p
group by p.name, unit_price
having unit_price between 150 and 350
order by unit_price desc;
--13-Farklı kategoriye ait ürünleri gösterir
select distinct(category_id) from products
--14-En pahalı ürün
select max(unit_price) as "En pahalı ürün" from products
--15-Stoğu en az olan ürün
select min(stock) as "Stoğu en az olan ürün" from products














