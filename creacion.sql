use DB_tp2
GO
CREATE TABLE empleados(
    nro_legajo int PRIMARY KEY IDENTITY,
    nombre varchar(20),
    email varchar(30) NOT NULL,
    localidad varchar(30),
    sueldo numeric(8,2) DEFAULT 9500

    CONSTRAINT CHK_sueldo
        CHECK(sueldo >= 9500)

)
GO

create table planta(
    cod_planta char PRIMARY KEY, 
    rubro VARCHAR(40)
    
    CONSTRAINT CHK_rubro
        CHECK(rubro in ('calzado deportivo',
            'calzado urbano','automotriz' ,'textil','reciclaje'))


);

CREATE TABLE trabaja(  
    nro_legajo int not null,
    cod_planta char not NULL

    CONSTRAINT FK_legajo FOREIGN KEY(nro_legajo)
        REFERENCES dbo.empleados(nro_legajo),

    CONSTRAINT FK_codPLanta FOREIGN KEY (cod_planta)
        REFERENCES dbo.planta(cod_planta)

);


exec sp_rename 'dbo.trabaja_en', 'trabaja'


alter table empleado
     DROP COLUMN mail;

   



EXEC sp_rename 'dbo.empleado.sueldo', 'salario', 'COLUMN'

ALTER TABLE empleado 
    ALTER COLUMN nombre VARCHAR (60) NOT NULL;

