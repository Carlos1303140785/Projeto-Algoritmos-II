PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS Midia (
    id_midia INTEGER PRIMARY KEY AUTOINCREMENT,
    id_tmdb INTEGER,
    tipo INTEGER NOT NULL CHECK (tipo IN (1, 2)),
    titulo TEXT NOT NULL,
    titulo_original TEXT,
    sinopse TEXT,
    caminho_capa TEXT,
    status_favorito NULL CHECK (tipo IN (1, 2, 3)),
    nota REAL CHECK (nota IS NULL OR nota BETWEEN 0 AND 10),
    idioma_original TEXT,
    data_lancamento TEXT CHECK (data_lancamento IS NULL OR date(data_lancamento) IS NOT NULL),
    UNIQUE (id_tmdb, tipo)
);

CREATE TABLE IF NOT EXISTS Filme (
    id_midia INTEGER PRIMARY KEY REFERENCES Midia (id_midia) ON DELETE CASCADE,
    duracao INTEGER CHECK (duracao IS NULL OR duracao > 0)
);

CREATE TABLE IF NOT EXISTS Serie (
    id_midia INTEGER PRIMARY KEY REFERENCES Midia (id_midia) ON DELETE CASCADE,
    n_episodios INTEGER CHECK (n_episodios IS NULL OR n_episodios >= 0),
    n_temporadas INTEGER CHECK (n_temporadas IS NULL OR n_temporadas >= 0)
);

CREATE TRIGGER IF NOT EXISTS trg_filme_tipo
BEFORE INSERT ON Filme
WHEN (SELECT tipo FROM Midia WHERE id_midia = NEW.id_midia) IS NOT 1
BEGIN
    SELECT RAISE(ABORT, 'Erro de tipo para Filme.');
END;

CREATE TRIGGER IF NOT EXISTS trg_serie_tipo
BEFORE INSERT ON Serie
WHEN (SELECT tipo FROM Midia WHERE id_midia = NEW.id_midia) IS NOT 2
BEGIN
    SELECT RAISE(ABORT, 'Erro de tipo para Serie.');
END;

CREATE TRIGGER IF NOT EXISTS trg_midia_tipo_imutavel
BEFORE UPDATE OF tipo ON Midia
WHEN NEW.tipo <> OLD.tipo
BEGIN
    SELECT RAISE(ABORT, 'O tipo da midia nao pode ser alterado.');
END;

CREATE TABLE IF NOT EXISTS Genero (
    id_genero INTEGER PRIMARY KEY,
    nome TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Diretorio (
    id_diretorio INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL UNIQUE COLLATE NOCASE
);

CREATE TABLE IF NOT EXISTS Possuir (
    id_genero INTEGER NOT NULL REFERENCES Genero (id_genero) ON DELETE RESTRICT,
    id_midia INTEGER NOT NULL REFERENCES Midia (id_midia) ON DELETE CASCADE,
    PRIMARY KEY (id_genero, id_midia)
);

CREATE TABLE IF NOT EXISTS Conter (
    id_diretorio INTEGER NOT NULL REFERENCES Diretorio (id_diretorio) ON DELETE CASCADE,
    id_midia INTEGER NOT NULL REFERENCES Midia (id_midia) ON DELETE CASCADE,
    data_adicao TEXT NOT NULL DEFAULT (datetime('now')),
    PRIMARY KEY (id_diretorio, id_midia)
);

CREATE INDEX IF NOT EXISTS idx_possuir_midia ON Possuir (id_midia);
CREATE INDEX IF NOT EXISTS idx_conter_midia ON Conter (id_midia);

CREATE VIEW IF NOT EXISTS vw_midia AS
SELECT m.*, f.duracao, s.n_temporadas, s.n_episodios
FROM Midia m
LEFT JOIN Filme f ON f.id_midia = m.id_midia
LEFT JOIN Serie s ON s.id_midia = m.id_midia;
