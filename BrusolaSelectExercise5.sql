use pubs

-- Question 1--
select title, pub_name, type
from titles
inner join publishers
on publishers.pub_id=titles.pub_id

-- Question 2--
select A.*, B.*
from stores A
inner join sales B
on A.stor_id=B.stor_id

--Question 3--
select A.stor_id, C.stor_name, A.title_id, B.title
from sales A
join stores C
on A.stor_id=C.stor_id
join titles B
on A.title_id=B.title_id

--Question 4--
select distinct A. title_id, A.title, A. type, A.price
from titles A
join titles B
on A.type=B.type
where A.price < 15
and B.price < 15
and A.price!=B.price
order by type

--Question 5--
select distinct A. title_id, A.title, A.pubdate
from titles A
join titles B
on A.pubdate=B.pubdate
and A.title_id<>B.title_id
order by pubdate

--Question 6--
select distinct C.au_fname, C.au_lname, A.title, 'Total Sales'=A.ytd_sales
from titles A
join titleauthor B
on A.title_id=B.title_id
join authors C
on B.au_id=C.au_id
where A.ytd_sales != ''
order by C.au_fname

--Question 7--
select T.title_id, T.title, T.type, TAU.au_id, AU.au_fname, AU.au_lname
from titles T
join titleauthor TAU
on T.title_id=TAU.title_id
join authors AU
on AU.au_id=TAU.au_id
where type = 'psychology'
and soundex(AU.au_fname) = soundex('Ann%')
