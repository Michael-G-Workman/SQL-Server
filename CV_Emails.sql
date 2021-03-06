/*
=========================================================================================================

CV Emails

By Michael G. Workman

This script returns info from the CV DB for emails that have been sent through the CV MVC Web Application

This example is freely distributable under terms of MIT open source license

=========================================================================================================
*/

SELECT ec.[ID]
      ,ec.[ContactName]
      ,ec.[ContactEmail]
      ,ec.[ContactPhone]
      ,cc.[category]
      ,ec.[WebMessage]
      ,ec.[EmailDate]
  FROM [CVDB].[dbo].[EmailContacts] ec
  INNER JOIN [CVDB].[dbo].[ContactCategories] cc
  ON cc.ID = ec.ContactCategories_ID