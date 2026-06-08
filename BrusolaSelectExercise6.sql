use pubs

--Question 1--
Select title_id, title
from titles
where title_id in (select title_id
    from sales
    where stor_id in (select stor_id
        from stores
        where stor_name = 'Eric the Read Books'))

--Question 2--
select title as 'Title of the most expensive book', price as 'Cost of the most expensive book'
from titles
where price = (select max(price)
	from titles)

--Question 3--
select stor_name as 'Store Name'
from stores
where stor_id in (select stor_id
    from sales
    where title_id in (select title_id
        from titles
        where type = 'psychology'))

--Question 4--
select au_fname as 'First Name', au_lname as 'Last Name'
from authors
where au_id in (select au_id
    from titleauthor
    where title_id in (select title_id
        from titles
        where pub_id in (select pub_id
            from publishers
            where city = 'Berkeley')))
order by au_fname asc

--Question 5--
select sum(qty) as 'Number of Books Bookbeat ordered'
from sales
where stor_id in (select stor_id
    from stores
    where stor_name = 'Bookbeat')

--Question 6--
select pub_name as 'Publisher Name'
from publishers
where pub_id in (select pub_id
    from titles
    where type = 'business')

--Question 7--
select title as 'Book Title', ytd_sales as 'Sales'
from titles 
where title_id in (select title_id
    from titles
    where ytd_sales is null)

--Question 8--
select title as 'Book Title'
from titles 
where pub_id = (select pub_id
    from publishers
    where pub_name = 'New Moon Books')

--Question 9--
select title as 'Book Title'
from titles 
where pub_id = (select pub_id
    from publishers
    where state = 'MA')

--Question 10-
select pub_id as 'Publisher ID', title as 'Book Title', ytd_sales as 'Sales'
from titles
where title_id in (select title_id
    from titles
    where ytd_sales is null)

--Question 11--
Select au_fname as 'First Name', au_lname as 'Last Name'
from authors
where au_id in (select au_id
    from titleauthor
    where title_id in (select title_id
        from titles
        where type like '%cook'))
order by au_fname asc

--Question 12--
select pub_name as 'Publisher Name'
from publishers
where pub_id in (select pub_id
    from titles
    where price in (select max(price)
        from titles))

--Question 13--
select title as 'Book Title', advance as 'Advance'
from titles
where advance in (select advance
    from titles
    where advance > 8000)

--Question 14--
select distinct au_fname as 'First Name', au_lname as 'Last Name'
from authors
where au_lname in (select au_lname
    from authors
    group by au_lname
    having count(au_lname) > 1)
