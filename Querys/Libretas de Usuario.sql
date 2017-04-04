SELECT Libreta.ID_libreta, Libreta., Libreta.ID_color 
	FROM Libreta_Usuario 
	INNER JOIN Libreta ON Libreta_Usuario.ID_libreta = Libreta.ID_libreta 
	INNER JOIN Usuario ON Libreta_Usuario.ID_usuario = Usuario.ID_usuario
	Where Usuario.ID_usuario = 1	
