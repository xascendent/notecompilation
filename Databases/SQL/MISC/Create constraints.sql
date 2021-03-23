CREATE TABLE [dbo].[StateRegions]
(
	[StateRegionId] [INT] IDENTITY(1,1) NOT NULL,
	[StateRegionName] [NVARCHAR](MAX) NULL,
	[LoadDate] [DATETIME] CONSTRAINT DF_StateRegion_LoadDate DEFAULT(GETDATE()),
	[Active] [BIT] CONSTRAINT DF_StateRegion_Active DEFAULT(1),
)
