BULK INSERT a1273106.[Materiales]
   FROM 'e:\wwwroot\a1273106\materiales.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )