select 
usuarios.id_usuario,nombre, colonia, email, celular 
from usuarios, perfil_usuario 
where usuarios.id_perfil=perfil_usuario.id_perfil and perfil_usuario.perfil='Cliente'