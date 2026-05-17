CREATE SCHEMA SAE_qualite_air;
SET search_path = SAE_qualite_air;

CREATE TABLE region (
    id_region       serial NOT NULL,
    lib_region      varchar NULL,
    descript_region varchar NULL,
    CONSTRAINT PK_REGION PRIMARY KEY (id_region)
);

CREATE TABLE departement (
    num_dep         varchar NOT NULL,
    id_region       INT NOT NULL,
    nom_departement varchar NULL,
    CONSTRAINT PK_DEPARTEMENT PRIMARY KEY (num_dep),
    CONSTRAINT FK_dep_region FOREIGN KEY (id_region) REFERENCES region (id_region)
);

CREATE TABLE commune (
    code_commune VARCHAR(5) not null,
    nom_commune  varchar null,
    num_dep      varchar not null,
    CONSTRAINT PK_COMMUNE PRIMARY KEY (code_commune),
    CONSTRAINT FK_COMMUNE_DEP FOREIGN KEY (num_dep) REFERENCES departement (num_dep)
);

CREATE TABLE qualite_air (
    OBJECTID    int primary key,
    date_ech    TIMESTAMP,
    code_qual   int,
    lib_qual    VARCHAR,
    coul_qual   VARCHAR,
    date_dif    TIMESTAMP,
    source      VARCHAR,
    type_zone   VARCHAR,
    code_zone   VARCHAR(5), 
    lib_zone    VARCHAR,
    code_no2    int,
    code_so2    int,
    code_o3     int,
    code_pm10   int,
    code_pm25   int,
    x_wgs84     REAL,
    y_wgs84     REAL,
    x_reg       REAL,
    y_reg       REAL,
    conc_no2    REAL,
    conc_so2    REAL,
    conc_o3     REAL,
    conc_pm10   REAL,
    conc_pm25   REAL,
    CONSTRAINT FK_QUALITE_COMMUNE FOREIGN KEY (code_zone) REFERENCES commune (code_commune)
);