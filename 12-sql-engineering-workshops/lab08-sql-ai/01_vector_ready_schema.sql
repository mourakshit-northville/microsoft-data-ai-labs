/*
SQL + AI workshop lab
Scenario: governed knowledge retrieval over product documentation
Topics: chunk storage, metadata, embeddings, filtered retrieval design

Note: vector data types/functions differ by SQL engine/version. This lab keeps the
schema portable and separates embedding storage from business metadata.
*/

CREATE SCHEMA ai;
GO

CREATE TABLE ai.Document (
    DocumentId      bigint IDENTITY(1,1) PRIMARY KEY,
    DocumentType    varchar(50) NOT NULL,
    BusinessDomain  varchar(100) NOT NULL,
    Title           nvarchar(500) NOT NULL,
    SourceUri       nvarchar(1000) NULL,
    SecurityLabel   varchar(50) NOT NULL,
    UpdatedAtUtc    datetime2(3) NOT NULL
);
GO

CREATE TABLE ai.DocumentChunk (
    ChunkId          bigint IDENTITY(1,1) PRIMARY KEY,
    DocumentId       bigint NOT NULL,
    ChunkOrdinal     int NOT NULL,
    ChunkText        nvarchar(max) NOT NULL,
    TokenEstimate    int NULL,
    EmbeddingModel   varchar(200) NULL,
    EmbeddingJson    nvarchar(max) NULL,
    CreatedAtUtc     datetime2(3) NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_DocumentChunk_Document FOREIGN KEY(DocumentId) REFERENCES ai.Document(DocumentId),
    CONSTRAINT UQ_DocumentChunk UNIQUE(DocumentId, ChunkOrdinal)
);
GO

CREATE INDEX IX_Document_DomainSecurity
ON ai.Document(BusinessDomain, SecurityLabel)
INCLUDE (Title, UpdatedAtUtc);
GO

CREATE OR ALTER VIEW ai.vw_SearchableChunks
AS
SELECT
    c.ChunkId,
    d.DocumentId,
    d.BusinessDomain,
    d.Title,
    d.SecurityLabel,
    c.ChunkText,
    c.EmbeddingModel,
    c.EmbeddingJson
FROM ai.DocumentChunk c
JOIN ai.Document d ON d.DocumentId = c.DocumentId;
GO

-- Retrieval design exercise:
-- 1. Apply security/domain filters BEFORE semantic ranking.
-- 2. Replace EmbeddingJson with the native vector type supported by your target SQL engine.
-- 3. Add an embedding generation pipeline and track model/version drift.
-- 4. Return citations (DocumentId, Title, SourceUri) with retrieved chunks.
-- 5. Do not give an AI agent unrestricted dynamic SQL access; expose approved views/procedures.
