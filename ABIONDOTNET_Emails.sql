/*
=========================================================================================================
AbionDotNet Emails Script

By Michael G. Workman

This script will retrieve all emails sent from the abion.net website, with a join to get the name
of a contact category.

This example is freely distributable under terms of MIT open source license
=========================================================================================================
*/

SELECT ec.[ID]
      ,ec.[ContactName]
      ,ec.[ContactEmail]
      ,ec.[ContactPhone]
      ,cc.[Category]
      ,ec.[WebMessage]
      ,ec.[EmailDate]
  FROM [AbionDotNetDB].[dbo].[EmailContacts] ec
  INNER JOIN [AbionDotNetDB].[dbo].[ContactCategories] cc
  ON ec.ContactCategories_ID = cc.ID
