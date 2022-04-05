CREATE DATABASE IF NOT EXISTS Modulo_5_ABPro_5;

#- Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada. 

CREATE USER 'ABPro5'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON  base_iteracion5.* TO 'ABPro5'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;

use Modulo_5_ABPro_5;
#crea tabla de usuarios, primary key usuario ID

CREATE TABLE usuarios (
usuario_id int not null,
nombre varchar (25) not null,
apellido varchar (25) not null,
clave varchar (25) not null,
zona_horaria varchar (25) default'-03:00',
genero  varchar (25) not null,
telefono  varchar (25) not null,
primary key (usuario_id)
);

#creacion segund tabla
CREATE TABLE ingresos (
id_ingreso int auto_increment,
usuario_id int not null,
fecha_hora_ingreso timestamp default current_timestamp,
primary key (id_ingreso, usuario_id, fecha_hora_ingreso),
constraint fk_ingresos_usuarios
foreign key (usuario_id) references usuarios(usuario_id) 
);

describe usuarios;
describe ingresos;

SET time_zone='-03:00';

#modificar time zone a UTC-2

#modificar time zone a UTC-2
ALTER table usuarios alter zona_horaria set DEFAULT '-02:00';

set time_zone='-02:00';


#llena tabla de usuarios
insert into usuarios (usuario_id, nombre, apellido, clave, genero, telefono)
values
(1, 'olivia','castro','olivia123', 'femenino','+56 9777 777 77'  ),
(2, 'elena', 'gonzalez', 'elena123','femenino','+56 9555 555 55'),
(3, 'jose', 'perez', 'jose123','masculino', '+56 9666 666 66' ),
(4, 'felipe', 'medel', 'felipe123','masculino' ,'+56 9444 444 44' ),
(5, 'laura', 'zapata', 'laura123','femenino','+56 9555 555 55' ),
(6, 'jorge', 'lopez','jorge123', 'masculino','+56 9666 666 66' ),
(7, 'magda', 'sanchez','magda123', 'femenino','+56 9777 777 77' ),
(8, 'juan', 'ferrer', 'juan123','masculino','+56 9888 888 88' );


#Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?
#se eligio el tipo de dato varchar porque todos los datos almacenados
#no necesitan pasar 

SELECT * from usuarios;
#crea tabla para almacenar ingresos. 

#llena tabla ingreso
insert into ingresos (usuario_id)
values
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8);

SELECT * from ingresos;

CREATE TABLE contactos (
    id_contacto int NOT NULL, 
    id_usuarios int not null,
    numero_de_telefono int not null,
    correo_electronico varchar (25) not null,
    primary key (id_contacto)
   );

describe contactos;

ALTER TABLE contactos add CONSTRAINT fk_contacto_usuario
foreign key (numero_de_telefono) references usuarios(usuario_id);
SELECT * from contactos;
 



