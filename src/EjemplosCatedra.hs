module EjemplosCatedra where
import Tipos

p3 :: Pixel
p3 = (3,3,3)

p0 :: Pixel
p0 = (0,0,0)

-- Video 0:
f0 = [[p0, p0, p0], [p3, p3, p3]]
f1 = [[p3, p3, p3], [p3, p3, p3]]
video0 = Agregar f1 (Agregar f0 (Iniciar f0))

-- Video 1:  En la versión comprimida, todos los frames son comprimidos (salvo el inicial)

v1f1 :: Frame
v1f1 = [[p3, p3, p0, p0, p0],
    [p3, p3, p0, p0, p0],
    [p0, p0, p0, p0, p0],
    [p0, p0, p0, p0, p0],
    [p0, p0, p0, p0, p0]]

v1f2 :: Frame
v1f2 = [[p0, p0, p0, p0, p0],
    [p0, p3, p3, p0, p0],
    [p0, p3, p3, p0, p0],
    [p0, p0, p0, p0, p0],
    [p0, p0, p0, p0, p0]]

v1f3 :: Frame
v1f3 = [[p0, p0, p0, p0, p0],
    [p0, p0, p0, p0, p0],
    [p0, p0, p3, p3, p0],
    [p0, p0, p3, p3, p0],
    [p0, p0, p0, p0, p0]]

v1f4 :: Frame
v1f4 = [[p0, p0, p0, p0, p0],
    [p0, p0, p0, p0, p0],
    [p0, p0, p0, p0, p0],
    [p0, p0, p0, p3, p3],
    [p0, p0, p0, p3, p3]]


v1 :: Video
v1 = Agregar v1f4 (Agregar v1f3 (Agregar v1f2 (Iniciar v1f1)))



-- Video 2:  En la versión comprimida, sólo los frames 2 y 4 son comprimidos

v2f1 :: Frame
v2f1 = [[p3, p3, p0, p0, p0],
    [p3, p3, p0, p0, p0],
    [p0, p0, p0, p0, p0],
    [p0, p0, p0, p0, p0],
    [p0, p0, p0, p0, p0]]

v2f2 :: Frame
v2f2 = [[p0, p0, p0, p0, p0],
    [p0, p3, p3, p0, p0],
    [p0, p3, p3, p0, p0],
    [p0, p0, p0, p0, p0],
    [p0, p0, p0, p0, p0]]

v2f3 :: Frame
v2f3 = [[p0, p0, p0, p0, p0],
    [p0, p0, p0, p0, p0],
    [p0, p0, p3, p3, p3],
    [p0, p0, p3, p3, p0],
    [p0, p0, p0, p0, p0]]

v2f4 :: Frame
v2f4 = [[p0, p0, p0, p0, p0],
    [p0, p0, p0, p0, p0],
    [p0, p0, p0, p0, p3],
    [p0, p0, p0, p3, p3],
    [p0, p0, p0, p3, p3]]


v2 :: Video
v2 = Agregar v2f4 (Agregar v2f3 (Agregar v2f2 (Iniciar v2f1)))