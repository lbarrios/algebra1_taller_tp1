module EjemplosPropios where
import Tipos

-- Colores
--
----- B&W
pNegro :: Pixel
pNegro = (0,0,0)
pGrisOscuro :: Pixel
pGrisOscuro = (1,1,1)
pGrisClaro :: Pixel
pGrisClaro = (2,2,2)
pBlanco :: Pixel
pBlanco = (3,3,3)
---- Primarios
pRojo :: Pixel
pRojo = (3,0,0)
pVerde :: Pixel
pVerde = (0,3,0)
pAzul :: Pixel
pAzul = (0,0,3)
---- Secundarios
pAmarillo :: Pixel
pAmarillo = (3,3,0)
pCian :: Pixel
pCian = (0,3,3)
pMagenta :: Pixel
pMagenta = (3,0,3)



-- Video1 : pixeles random
--
video1f0 :: Frame
video1f0 = [
    [ pGrisOscuro,       pRojo,  pGrisClaro],
    [      pVerde,   pAmarillo,       pCian],
    [     pBlanco,  pGrisClaro,      pNegro]]

video1f1 :: Frame
video1f1 = [
    [  pGrisClaro,    pMagenta,     pBlanco],
    [      pVerde,  pGrisClaro,       pAzul],
    [      pNegro,       pAzul,       pCian]]

video1f2 :: Frame
video1f2 = [
    [ pGrisOscuro, pGrisOscuro,      pNegro],
    [   pAmarillo,       pAzul,   pAmarillo],
    [      pNegro,   pAmarillo,       pAzul]]

video1 = Agregar video1f2 (Agregar video1f1 (Iniciar video1f2))
