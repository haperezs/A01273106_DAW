SET DATEFORMAT dmy

BULK INSERT a1273106.[Entregan]
   FROM 'e:\wwwroot\a1273106\entregan.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )