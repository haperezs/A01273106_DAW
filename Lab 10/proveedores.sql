BULK INSERT a1273106.[Proveedores]
   FROM 'e:\wwwroot\a1273106\proveedores.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )