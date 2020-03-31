select name
from member natural join borrowed natual join books
where publisher = "McGraw-Hill"


select S.name
from member as S
where not exists (
    (
        select isbn
        from books
        where publisher = "Mc"
    )
    except
    (
        select isbn
        from borrowed as T
        where S.memb_no = T.memb_no
    )
)


with t1(name, memb_no, counts) as 
(
    select name, memb_no, count(distinct isbn)
    from member natural join borrowed natual join books
    where publisher = "McGraw -Hill"
    group by name, memb_no
)
select name memb_no
from t1
where counts > 5
