Use SOCIAL

-- Tabla Usuario
CREATE TABLE Usuarios (
    UsuarioId INT PRIMARY KEY IDENTITY,
    NombreUsuario NVARCHAR(50) NOT NULL,
	ApellidoUsuario NVARCHAR(50) NOT NULL,
    CorreoElectronico NVARCHAR(100) NOT NULL,
	FechaNacimiento DATETIME NOT NULL,
    Contraseña NVARCHAR(100) NOT NULL
);

-- Tabla Publicación
CREATE TABLE Publicaciones (
    PublicacionId INT PRIMARY KEY IDENTITY,
    Contenido NVARCHAR(MAX) NOT NULL,
    FechaHoraPublicacion DATETIME NOT NULL,
    UsuarioId INT NOT NULL,
    FOREIGN KEY (UsuarioId) REFERENCES Usuarios(UsuarioId)
);

-- Tabla Comentario
CREATE TABLE Comentarios (
    ComentarioId INT PRIMARY KEY IDENTITY,
    Contenido NVARCHAR(MAX) NOT NULL,
    FechaHoraComentario DATETIME NOT NULL,
    UsuarioId INT NOT NULL,
    PublicacionId INT NOT NULL,
    FOREIGN KEY (UsuarioId) REFERENCES Usuarios(UsuarioId),
    FOREIGN KEY (PublicacionId) REFERENCES Publicaciones(PublicacionId)
);

-- Tabla Amistad
CREATE TABLE Amistades (
    AmistadId INT PRIMARY KEY IDENTITY,
    UsuarioSolicitanteId INT NOT NULL,
    UsuarioAceptadoId INT NOT NULL,
    Estado NVARCHAR(20) NOT NULL, -- Por ejemplo: Pendiente, Aceptada, Rechazada
    FOREIGN KEY (UsuarioSolicitanteId) REFERENCES Usuarios(UsuarioId),
    FOREIGN KEY (UsuarioAceptadoId) REFERENCES Usuarios(UsuarioId)
);