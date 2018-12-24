/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) ec.[ID]
      ,ec.[ContactName]
      ,ec.[ContactEmail]
      ,cc.[Category]
      ,ec.[WebMessage]
      ,ec.[EmailDate]
  FROM [AbionDotNetDB].[dbo].[EmailContacts] ec
  INNER JOIN [AbionDotNetDB].[dbo].[ContactCategories] cc
  ON ec.ContactCategories_ID = cc.ID