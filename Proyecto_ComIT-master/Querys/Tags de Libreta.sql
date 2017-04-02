	Select Tag.ID_tag , Tag.NameTag 
	From Libreta 
	Inner Join Libreta_Tag ON Libreta.ID_libreta = Libreta_Tag.ID_libreta 
	Inner Join Tag ON Libreta_Tag.ID_tag = Tag.ID_tag
	Where Libreta.ID_libreta = 1	