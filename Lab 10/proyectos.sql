BULK INSERT a1273106.[Proyectos]
   FROM 'e:\wwwroot\a1273106\proyectos.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )