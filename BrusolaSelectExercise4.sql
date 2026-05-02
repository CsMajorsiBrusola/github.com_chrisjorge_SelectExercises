--Christian Jorge A. Brusola
--BSIT 2-208

use pubs

select count(title)
from titles
order by pub_id

--Question 1
select type, MaxAdvance = max(advance)
from titles
where advance is not Null
group by type

--Question 2
select type, AveragePrice = avg(price)
from titles
where price is not Null
group by type

--Question 3
select pub_id, AveragePrice = avg(price)
from titles 
group by pub_id
having count(title_id)>=5

--Question 4
select distinct pub_id, AveragePrice = avg(price)
from titles 
group by pub_id

--Question 5
select type, MinimumPrice = min(price)
from titles
where price is not null
group by type

--Question 6
select type, MaximumPrice = max(price)
from titles
where price is not null
group by type

--Question 7
select pub_id, BookSold = sum(ytd_sales)
from titles
group by pub_id

--Question 8
select pub_id, AveragePrice = avg(price)
from titles
where price < 10
group by pub_id

--Question 9
select type, NumberofBooks = count(title)
from titles
group by type
