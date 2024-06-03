-- Creación de la tabla Cliente
CREATE TABLE Cliente (
    IDCliente SERIAL PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    FechaNacimiento DATE,
    Genero VARCHAR(10),
    Direccion VARCHAR(100),
    Ciudad VARCHAR(50),
    CodigoPostal VARCHAR(10),
    Pais VARCHAR(50),
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(100),
    TipoCliente VARCHAR(50),
    FechaRegistro DATE
);

-- Creación de la tabla Cuenta
CREATE TABLE Cuenta (
    IDCuenta SERIAL PRIMARY KEY,
    IDCliente INT,
    TipoCuenta VARCHAR(50),
    Moneda VARCHAR(10),
    SaldoActual DECIMAL(18, 2),
    FechaApertura DATE,
    Estado VARCHAR(20),
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);

-- Creación de la tabla Transaccion
CREATE TABLE Transaccion (
    IDTransaccion SERIAL PRIMARY KEY,
    TipoTransaccion VARCHAR(20),
    IDCuentaOrigen INT,
    IDCuentaDestino INT,
    Monto DECIMAL(18, 2),
    Moneda VARCHAR(10),
    Descripcion VARCHAR(100),
    FechaHora TIMESTAMP,
    SaldoPosteriorOrigen DECIMAL(18, 2),
    SaldoPosteriorDestino DECIMAL(18, 2),
    FOREIGN KEY (IDCuentaOrigen) REFERENCES Cuenta(IDCuenta),
    FOREIGN KEY (IDCuentaDestino) REFERENCES Cuenta(IDCuenta)
);

-- Creación de la tabla Transferencia
CREATE TABLE Transferencia (
    IDTransferencia SERIAL PRIMARY KEY,
    IDClienteOrigen INT,
    IDClienteDestino INT,
    IDCuentaOrigen INT,
    IDCuentaDestino INT,
    Monto DECIMAL(18, 2),
    Moneda VARCHAR(10),
    Descripcion VARCHAR(100),
    FechaHora TIMESTAMP,
    FOREIGN KEY (IDClienteOrigen) REFERENCES Cliente(IDCliente),
    FOREIGN KEY (IDClienteDestino) REFERENCES Cliente(IDCliente),
    FOREIGN KEY (IDCuentaOrigen) REFERENCES Cuenta(IDCuenta),
    FOREIGN KEY (IDCuentaDestino) REFERENCES Cuenta(IDCuenta)
);

-- Creación de la tabla Reporte
CREATE TABLE Reporte (
    IDReporte SERIAL PRIMARY KEY,
    IDCliente INT,
    TipoReporte VARCHAR(50),
    FechaGeneracion TIMESTAMP,
    Detalles TEXT, -- Puedes adaptar el tipo de dato según el formato del reporte
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);

-- Creación de la tabla Usuario
CREATE TABLE Usuario (
    IDUsuario SERIAL PRIMARY KEY,
    NombreUsuario VARCHAR(50),
    Contraseña VARCHAR(100),
    IDClienteAsociado INT,
    Rol VARCHAR(20),
    FOREIGN KEY (IDClienteAsociado) REFERENCES Cliente(IDCliente)
);

-- Creación de la tabla Tarjeta
CREATE TABLE Tarjeta (
    IDTarjeta SERIAL PRIMARY KEY,
    IDCliente INT,
    IDCuentaAsociada INT,
    TipoTarjeta VARCHAR(20),
    NumeroTarjeta VARCHAR(20),
    FechaExpiracion DATE,
    CVV VARCHAR(10),
    Estado VARCHAR(20),
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente),
    FOREIGN KEY (IDCuentaAsociada) REFERENCES Cuenta(IDCuenta)
);

-- Creación de la tabla Beneficiario
CREATE TABLE Beneficiario (
    IDBeneficiario SERIAL PRIMARY KEY,
    IDCliente INT,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    TipoCuenta VARCHAR(50),
    NumeroCuenta VARCHAR(50),
    Banco VARCHAR(50),
    Pais VARCHAR(50),
    Descripcion VARCHAR(100),
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);
